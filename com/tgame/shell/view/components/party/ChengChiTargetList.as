package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class ChengChiTargetList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var chengchi:FTextArea;
      
      private var dengji:FTextArea;
      
      private var qingkuang:FTextArea;
      
      private var jieceng:FTextArea;
      
      private var Meng_bit:Bitmap;
      
      public function ChengChiTargetList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 24;
         this.tf = new TextFormat();
         this.tf.align = "center";
         if(data.biaoshi % 2 == 1)
         {
            this.Meng_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
            this.Meng_bit.x = 0;
            this.Meng_bit.y = 0;
            this.Meng_bit.width = 385;
            this.Meng_bit.height = 24;
            addChild(this.Meng_bit);
         }
         this.chengchi = new FTextArea();
         addChild(this.chengchi);
         this.chengchi.multiline = true;
         this.chengchi.wordWrap = true;
         this.chengchi.width = 60 + 80;
         this.chengchi.height = 24;
         this.chengchi.x = 10 - 5 - 3;
         this.chengchi.y = 3;
         this.chengchi.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.name + " </font>";
         this.jieceng = new FTextArea();
         addChild(this.jieceng);
         this.jieceng.wordWrap = true;
         this.jieceng.width = 120;
         this.jieceng.height = 24;
         this.jieceng.x = 10 - 5 - 3 + 120 - 15;
         this.jieceng.y = 3;
         this.jieceng.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + this.getJieceng(data.jieceng) + " </font>";
         this.qingkuang = new FTextArea();
         addChild(this.qingkuang);
         this.qingkuang.wordWrap = true;
         this.qingkuang.width = 120;
         this.qingkuang.height = 24;
         this.qingkuang.x = 10 - 5 - 3 + 120 - 15 + 60 + 20;
         this.qingkuang.y = 3;
         this.qingkuang.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + this.getZhanling(data.qingkuang) + " </font>";
         this.dengji = new FTextArea();
         addChild(this.dengji);
         this.dengji.multiline = true;
         this.dengji.wordWrap = true;
         this.dengji.width = 120;
         this.dengji.height = 24;
         this.dengji.x = 240 - 20 + 50 + 18;
         this.dengji.y = 3;
         this.dengji.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.dengji + " </font>";
      }
      
      private function getJieceng(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("一级城池");
               break;
            case 2:
               _loc2_ = LanResManager.getLanCommonTextWords("二级城池");
               break;
            case 3:
               _loc2_ = LanResManager.getLanCommonTextWords("三级城池");
               break;
            case 0:
               _loc2_ = LanResManager.getLanCommonTextWords("皇城");
         }
         return _loc2_;
      }
      
      private function getZhanling(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = LanResManager.getLanCommonTextWords("已占领");
               break;
            case 0:
               _loc2_ = LanResManager.getLanCommonTextWords("未占领");
         }
         return _loc2_;
      }
   }
}

