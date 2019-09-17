window.access = (function () {
    var access = {
        thatAvailable: function (param) {
          /*
          {
          .. адрес ..
          type: 'table','report',
          class : 'users','accounts','allCounts'
          form : 'list' , 'form'
          part: 'main',
          unit: 'uid',
          -- user --
          gid: в клиентской части не используется
          uid:
          -- команда --
          line: 'соманда запроса'
          }
          */
          // временный скрипт симулирует работу функции
            var tablesList = ['acts','authors','books','examples','genres','places','readers'];
            switch (param.type) {
              case 'report':
                return []
                break;
              case 'table':
                switch (param.form) {
                  case 'list':
                    return tablesList;
                    break;
                  case 'form':
                    return tablesList;
                  break;
                }
                break;
            }
        }
    };
    return access;
}());
