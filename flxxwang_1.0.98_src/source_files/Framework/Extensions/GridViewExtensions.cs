using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

namespace Framework.Extensions
{
    public static class GridViewExtensions
    {
        public static int GetColumnIndex(this GridView gv, string colName)
        {
            int ret = -1;
            int i = 0;
            i = 0;
            while (i < gv.Columns.Count)
            {
                if (gv.Columns[i].GetType() == typeof(BoundField))
                {
                    BoundField bfield = (BoundField)gv.Columns[i];
                    if (bfield.DataField.ToUpper() == colName.ToUpper())
                    {
                        break;
                    }
                }
                if (gv.Columns[i].GetType() == typeof(CheckBoxField))
                {
                    CheckBoxField bfield = (CheckBoxField)gv.Columns[i];
                    if (bfield.DataField.ToUpper() == colName.ToUpper())
                    {
                        break;
                    }
                }
                if (gv.Columns[i].GetType() == typeof(HyperLinkField))
                {
                    HyperLinkField bfield = (HyperLinkField)gv.Columns[i];
                    if (bfield.SortExpression.ToUpper() == colName.ToUpper())
                    {
                        break;
                    }
                }
                if (gv.Columns[i].GetType() == typeof(ImageField))
                {
                    ImageField bfield = (ImageField)gv.Columns[i];
                    if (bfield.SortExpression.ToUpper() == colName.ToUpper())
                    {
                        break;
                    }
                }
                if (gv.Columns[i].GetType() == typeof(ButtonField))
                {
                    ButtonField bfield = (ButtonField)gv.Columns[i];
                    if (bfield.SortExpression.ToUpper() == colName.ToUpper())
                    {
                        break;
                    }
                }
                if (gv.Columns[i].GetType() == typeof(CommandField))
                {
                    CommandField bfield = (CommandField)gv.Columns[i];
                    if (bfield.SortExpression.ToUpper() == colName.ToUpper())
                    {
                        break;
                    }
                }
                if (gv.Columns[i].GetType() == typeof(TemplateField))
                {
                    TemplateField bfield = (TemplateField)gv.Columns[i];
                    if (bfield.SortExpression.ToUpper() == colName.ToUpper())
                    {
                        break;
                    }
                }
                i++;
            }
            if (i < gv.Columns.Count)
            {
                ret = i;
            }
            return ret;
        }

        //public static void ShowHeadWhenNoData(this GridView gv, bool ShowOneEmptyRow)
        //{//发现在.net 4.0中已经有ShowHeaderWhenEmpty属性了，所以这个方法就没有意义了，
            //只有一点参考价值。
        //    DataTable DT = new DataTable();
        //    if (gv.Rows.Count == 0)
        //    {
        //        for (int i = 0; i < gv.Columns.Count; i++)
        //        {
        //            if (gv.Columns[i].GetType() == typeof(BoundField))
        //            {
        //                BoundField bfield = (BoundField)gv.Columns[i];
        //                DT.Columns.Add(bfield.DataField);
        //            }
        //            if (gv.Columns[i].GetType() == typeof(CheckBoxField))
        //            {
        //                CheckBoxField bfield = (CheckBoxField)gv.Columns[i];
        //                DT.Columns.Add(bfield.DataField);
        //            }
        //            if (gv.Columns[i].GetType() == typeof(HyperLinkField))
        //            {
        //                HyperLinkField bfield = (HyperLinkField)gv.Columns[i];
        //                DT.Columns.Add(bfield.SortExpression);
        //            }
        //            if (gv.Columns[i].GetType() == typeof(ImageField))
        //            {
        //                ImageField bfield = (ImageField)gv.Columns[i];
        //                DT.Columns.Add(bfield.SortExpression);
        //            }
        //            if (gv.Columns[i].GetType() == typeof(ButtonField))
        //            {
        //                ButtonField bfield = (ButtonField)gv.Columns[i];
        //                DT.Columns.Add(bfield.SortExpression);
        //            }
        //            if (gv.Columns[i].GetType() == typeof(CommandField))
        //            {
        //                CommandField bfield = (CommandField)gv.Columns[i];
        //                DT.Columns.Add(bfield.SortExpression);
        //            }
        //            if (gv.Columns[i].GetType() == typeof(TemplateField))
        //            {
        //                TemplateField bfield = (TemplateField)gv.Columns[i];
        //                DT.Columns.Add(bfield.SortExpression);
        //            }
        //        }
        //        DataRow dr = DT.NewRow();
        //        for (int i = 0; i < DT.Columns.Count; i++)
        //        {
        //            if (gv.Columns[i].GetType() == typeof(CheckBoxField))
        //            {
        //                dr[i] = false;
        //            }
        //            else
        //            {
        //                dr[i] = "无数据";
        //            }
        //        }
        //        DT.Rows.Add(dr);
        //        gv.DataSourceID = "";
        //        gv.DataSource = DT;
        //        gv.DataBind();
        //        for (int i = 0; i < gv.Rows[0].Cells.Count; i++)
        //        {
        //            gv.Rows[0].Cells[i].Text = "无数据";
        //        }
        //        if (ShowOneEmptyRow)
        //        {
        //            gv.Rows[0].Enabled = false;
        //        }
        //        else
        //        {
        //            gv.Rows[0].Visible = false;
        //        }
        //    }
        //}

        public static void CheckRowsAll(this GridView gv, int CellOfCheckBoxPosition)
        {
            for (int i = 0; i < gv.Rows.Count; i++)
            {
                if (gv.Rows[i].RowType == DataControlRowType.DataRow)
                {
                    ((CheckBox)gv.Rows[i].Cells[CellOfCheckBoxPosition].Controls[1]).Checked = true;
                }
            }
        }

        public static object[] GetSelectedItemsKeyValue(this GridView gv, int CheckBoxColIndex)
        {
            List<object> list = new List<object>();
            for (int i = 0; i < gv.Rows.Count; i++)
            {
                if ((gv.Rows[i].RowType == DataControlRowType.DataRow) && ((CheckBox)gv.Rows[i].Cells[CheckBoxColIndex].Controls[1]).Checked)
                {
                    
                    list.Add(gv.DataKeys[i].Value);
                }
            }
            return list.ToArray();
        }
    }
}
