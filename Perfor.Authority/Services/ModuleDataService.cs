﻿using Perfor.Authority.Data;
using Perfor.Lib.Helpers;
using Perfor.Lib.Helpers.Mssql;
using Perfor.Lib.Extension;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Perfor.Authority.Services
{
    /**
     * @ 模块管理
     * */
    public class ModuleDataService : DataOperation<ModuleData>
    {
        #region Identity
        public ModuleDataService() { }
        #endregion

        /**
         * @ 修改
         * */
        public override bool Update(IEnumerable<ModuleData> menu)
        {
            bool succeess = true;
            if (menu.IsNullOrEmpty())
                return succeess;

            MssqlUpdate update = new MssqlUpdate(TableName);
            foreach (var item in menu)
            {
                update.UpdateObject<ModuleData>(item);
                update.AddWhere(Primarykey, item.ID);
                update.SaveChange();
            }

            return succeess;
        }

        /**
         * @ 新增项
         * */
        public override bool Add(IEnumerable<ModuleData> menu)
        {
            bool succeess = true;
            if (menu == null)
                return succeess;

            MssqlInsert insert = new MssqlInsert(TableName);
            foreach (var item in menu)
            {
                item.ID = Guid.NewGuid().ToString("N");
                insert.InsertObject<ModuleData>(item);
            }
            insert.SaveChange();

            return succeess;
        }

        /**
         * @ 表名称
         * */
        public override string TableName
        {
            get { return "ModuleData"; }
        }
    }
}
