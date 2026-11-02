package com.tgame.shell.view.components
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class FengLuList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var fenghao:FTextArea;
      
      private var guding:FTextArea;
      
      private var meitian:FTextArea;
      
      public function FengLuList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 48;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.fenghao = new FTextArea();
         addChild(this.fenghao);
         this.fenghao.multiline = true;
         this.fenghao.wordWrap = true;
         this.fenghao.width = 150;
         this.fenghao.height = 60;
         if(data.fenghao == 6)
         {
            this.fenghao.y = 4 + 3;
         }
         else
         {
            this.fenghao.y = 16;
         }
         this.fenghao.x = -3 + 20 - 10 + 10;
         this.fenghao.htmlText = "<font color = \'" + this.getColor(data.fenghao) + "\'>" + this.getFenghao(data.fenghao) + " </font>";
         this.guding = new FTextArea();
         addChild(this.guding);
         this.guding.multiline = true;
         this.guding.defaultTextFormat = this.tf;
         this.guding.wordWrap = true;
         this.guding.width = 325;
         this.guding.height = 60;
         this.guding.x = 35 + 71 + 10 + 7 + 4 - 50 - 15 - 5 - 10;
         this.guding.y = 4 + 12;
         this.guding.htmlText = "<font color = \'" + this.getColor(data.fenghao) + "\'>" + data.guding + " </font>";
         this.meitian = new FTextArea();
         addChild(this.meitian);
         this.meitian.multiline = true;
         this.meitian.defaultTextFormat = this.tf;
         this.meitian.wordWrap = true;
         this.meitian.width = 200;
         this.meitian.height = 60;
         this.meitian.x = 35 + 204 + 10 - 60 - 7 - 15 + 226 - 6 - 90;
         this.meitian.y = 4 + 12;
         this.meitian.htmlText = "<font color = \'" + this.getColor(data.fenghao) + "\'>" + data.meiri + " </font>";
      }
      
      private function getColor(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = StaticValue.ORANGE_HTML;
               break;
            case 6:
               _loc2_ = StaticValue.ORANGE_HTML;
               break;
            case 2:
               _loc2_ = StaticValue.YELLOW_HTML;
               break;
            case 3:
               _loc2_ = StaticValue.YELLOW_HTML;
               break;
            case 4:
               _loc2_ = StaticValue.GREEN_HTML;
               break;
            case 5:
               _loc2_ = StaticValue.GREEN_HTML;
               break;
            case 0:
               _loc2_ = StaticValue.WHITE_HTML;
         }
         return _loc2_;
      }
      
      private function getFenghao(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("皇主");
               break;
            case 6:
               _loc2_ = LanResManager.getLanCommonTextWords("皇后") + "<br>" + LanResManager.getLanCommonTextWords("亲王");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("列侯");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("丞相");
               break;
            case 4:
               _loc2_ = LanResManager.getLanCommonTextWords("御史");
               break;
            case 5:
               _loc2_ = LanResManager.getLanCommonTextWords("尚书");
               break;
            case 0:
               _loc2_ = LanResManager.getLanCommonTextWords("帮众");
         }
         return _loc2_;
      }
   }
}

