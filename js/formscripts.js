
var examples_form = {
  whenEndLoad:function () {
    var thisEl = this.element;
    var exid = thisEl.find('[name=exid]').text();
    if (!exid) {
      var data = thisEl.form('option','relationshipElement').data();
      if ('importData' in data) {
        data.importData(this.element);
      }
    }
  }
}




var authors_form = {

  whenEndLoad:function () {
    var thisEl = this.element;
    thisEl.form('option','whenSevedForm',tabsLock);
    function tabsLock() {
      var aid = thisEl.find('[name="aid"]').text();
      if (aid) {
          thisEl.find('[href="#books"]').closest('li').removeClass('disabled');
      }else{
          thisEl.find('[href="#books"]').closest('li').addClass('disabled');
      }
    }
    tabsLock();

    function detDataForBooks(el) {
      var aid = thisEl.find('[name=aid]').text();
      var aname = thisEl.find('[name=aname]').val();
      var rowEl = el.find('#authors .row').clone();
      var aidEl = rowEl.find('[name=aid]');
      aidEl.text(aid);
      aidEl.attr('data-href','/authors_form/?aid='+aid);
      rowEl.find('[name=aname]').text(aname);
      rowEl.removeClass('subrow');
      rowEl.attr({ value: 1});
      el.find('#authors').append(rowEl);
      setTimeout(()=>{
         rowEl.changeDetect('null');
       },100);
    }


    var showTab = (ev,ui)=>{
      var aid = thisEl.find('[name=aid]').text();
      if (ev.currentTarget.hash == "#books") {
        var booksJourEl =  thisEl.find('#books .journal');
        var links = booksJourEl.journal('option','links');

        if (! links) {
          var lnk = 'is_deleted = 0 && authors.aid = '+aid;
          booksJourEl.journal('option','links',lnk);
        }
        booksJourEl.journal('applyFilter',0);
        thisEl.find('#books #new-element').data({importData:detDataForBooks});

      }
    }
    thisEl.find('.formtabs').wintabs( "option","activate", showTab);

  }

}


var books_form = {
  whenEndLoad:function () {
    var thisEl = this.element;
    var bid = '';

    thisEl.form('option','whenSevedForm',tabsLock);
    function tabsLock() {
      bid = thisEl.find('[name="bid"]').text();
      if (bid) {
          thisEl.find('[href="#examples"]').closest('li').removeClass('disabled');
      }else{
          thisEl.find('[href="#examples"]').closest('li').addClass('disabled');
      }
    }
    tabsLock();

    if (!bid) {
      var data = thisEl.form('option','relationshipElement').data();
      if ('importData' in data) {
        data.importData(this.element);
      }
    }

    function detDataForExample(el) {
      el.find('[name="bid"]').text(bid).attr('data-href','/books_form/?bid='+bid);
      el.find('[name="bname"]').text( thisEl.find('[name="bname"]').val() );
      el.find('#books .row').removeClass('subrow');
    }


    var showTab = (ev,ui)=>{
      bid = thisEl.find('[name=aid]').text();
      if (ev.currentTarget.hash == "#examples") {
        var examplesJourEl =  thisEl.find('#examples .journal');
        var links = examplesJourEl.journal('option','links');
        if (! links) {
          var lnk = 'is_deleted = 0 && bid = '+bid;
          examplesJourEl.journal('option','links',lnk);
        }
        examplesJourEl.journal('applyFilter',0);
        thisEl.find('#examples #new-element').data({importData:detDataForExample});

      }
    }
    thisEl.find('.formtabs').wintabs( "option","activate", showTab);









  }
}
