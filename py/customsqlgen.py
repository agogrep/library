from agog import sqlgen


def journal_books(**arg):
    pattern = '''
    SELECT b3.bid, b3.bname, b3.sdate, IFNULL(b3.author,'') author, IFNULL(b3.genre,'') genre, b3.descr, b3.is_deleted, b3.ex examples, (b3.ex-b3.us) available  FROM
    (
        SELECT b2.bid, b2.bname, b2.sdate, b2.author, b2.genre, b2.descr, b2.ex, b2.is_deleted, COUNT(e2.exid) us FROM
        (
            SELECT b1.bid, b1.bname, b1.sdate, b1.author, b1.genre, b1.descr, b1.is_deleted, COUNT(e.bid) ex FROM
            (
                SELECT b.bid, b.bname, b.sdate, GROUP_CONCAT(a.aname SEPARATOR ', ' ) author, GROUP_CONCAT(g.gname SEPARATOR ', ' ) genre, descr, is_deleted FROM ({0}) b
                LEFT OUTER JOIN (SELECT DISTINCT aid, bid, aname FROM aid_bid
                    INNER JOIN authors  USING(aid)) a ON b.bid = a.bid
                LEFT OUTER JOIN (SELECT DISTINCT gnid, bid, gname FROM gnid_bid
                    INNER JOIN genres  USING(gnid)) g ON b.bid = g.bid
                GROUP BY b.bid
            ) b1
                LEFT OUTER JOIN examples e ON e.bid = b1.bid
            GROUP BY b1.bid
        ) b2
        LEFT OUTER JOIN
        (
            SELECT e.exid, e.bid, a.enddate FROM examples e
            LEFT OUTER JOIN acts a USING(exid) WHERE a.enddate = 0
        ) e2 ON b2.bid = e2.bid
        GROUP BY b2.bid
    ) b3
    '''

    return pattern.format( sqlgen.journal(**arg) )

def journal_examples(**arg):
    pattern = '''
        SELECT DISTINCT e.exid, e.code, e.bid, b1.bname, b1.sdate, b1.author, b1.genre, e.descr, IF(e2.enddate=0,0,1) available, e.is_deleted  FROM ({0}) e

        LEFT OUTER JOIN
        (
            SELECT b.bid, b.bname, b.sdate, GROUP_CONCAT(a.aname SEPARATOR ', ' ) author, GROUP_CONCAT(g.gname SEPARATOR ', ' ) genre, descr FROM books b
            LEFT OUTER JOIN (SELECT DISTINCT aid, bid, aname FROM aid_bid
                INNER JOIN authors  USING(aid)) a ON b.bid = a.bid
            LEFT OUTER JOIN (SELECT DISTINCT gnid, bid, gname FROM gnid_bid
                INNER JOIN genres  USING(gnid)) g ON b.bid = g.bid
            GROUP BY b.bid
        ) b1 ON e.bid = b1.bid

        LEFT OUTER JOIN
        (
            SELECT e1.exid, a.enddate FROM examples e1
            LEFT OUTER JOIN acts a USING(exid) WHERE a.enddate = 0
        ) e2 ON e.exid = e2.exid
    '''

    return pattern.format( sqlgen.journal(**arg) )


def journal_acts(**arg):
    pattern = '''
        SELECT a2.acid, a2.rid, a2.state, a2.startdate, a2.enddate, a2.descr, a2.is_deleted,
        IFNULL(e2.exid,'') exid,
        IFNULL(e2.code,'') code,
        IFNULL(e2.bid,'') bid,
        IFNULL(e2.bname,'') bname,
        IFNULL(e2.author,'') author,
        IFNULL(e2.genre,'') genre,
        IFNULL(r.rname,'') rname
        FROM ({0}) a2
        LEFT OUTER JOIN
        (
            SELECT e1.exid, e1.code, e1.bid, b1.bname, b1.author, b1.genre FROM examples e1
            LEFT OUTER JOIN
            (
                SELECT b.bid, b.bname, GROUP_CONCAT(a.aname SEPARATOR ', ' ) author, GROUP_CONCAT(g.gname SEPARATOR ', ' ) genre FROM
                        (
                           SELECT DISTINCT b0.bid, b0.bname  FROM
                            (
                            SELECT e.exid, e.bid FROM ({0}) a
                            INNER JOIN examples e ON e.exid = a.exid
                            ) ex
                            INNER JOIN books b0 ON ex.bid = b0.bid
                        ) b
                LEFT OUTER JOIN (SELECT DISTINCT aid, bid, aname FROM aid_bid
                    INNER JOIN authors  USING(aid)) a ON b.bid = a.bid
                LEFT OUTER JOIN (SELECT DISTINCT gnid, bid, gname FROM gnid_bid
                    INNER JOIN genres  USING(gnid)) g ON b.bid = g.bid
                GROUP BY b.bid
            ) b1 ON e1.bid = b1.bid
        ) e2 ON e2.exid = a2.exid
        LEFT OUTER JOIN readers r ON a2.rid = r.rid
    '''
    return pattern.format( sqlgen.journal(**arg) )
