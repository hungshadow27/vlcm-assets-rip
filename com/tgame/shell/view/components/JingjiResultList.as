package com.tgame.shell.view.components
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.text.*;
   
   public class JingjiResultList extends FListCellRenderer
   {
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      public function JingjiResultList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 23;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 19;
            y = 3;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            if(data.duiwu == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else
            {
               textColor = StaticValue.YELLOW;
            }
            htmlText = data.paiming;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 60;
            y = 3;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            if(data.duiwu == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else
            {
               textColor = StaticValue.YELLOW;
            }
            htmlText = data.name;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 161;
            y = 3;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            if(data.duiwu == 2)
            {
               textColor = StaticValue.BLUE;
               htmlText = LanResManager.getLanCommonTextWords("蓝队");
            }
            else
            {
               textColor = StaticValue.YELLOW;
               htmlText = LanResManager.getLanCommonTextWords("黄队");
            }
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 239;
            y = 3;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            if(data.duiwu == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else
            {
               textColor = StaticValue.YELLOW;
            }
            htmlText = data.jsNum;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 295;
            y = 3;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            if(data.duiwu == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else
            {
               textColor = StaticValue.YELLOW;
            }
            htmlText = Math.floor(data.shenglv / 100) + "%";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 362;
            y = 3;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            if(data.duiwu == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else
            {
               textColor = StaticValue.YELLOW;
            }
            htmlText = data.jbNum;
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 439;
            y = 3;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            if(data.duiwu == 2)
            {
               textColor = StaticValue.BLUE;
            }
            else
            {
               textColor = StaticValue.YELLOW;
            }
            htmlText = data.bjbNum;
         }
         addChild(this.ft);
      }
   }
}

