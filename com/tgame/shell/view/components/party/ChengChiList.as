package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class ChengChiList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var chengchi:FTextArea;
      
      private var dengji:FTextArea;
      
      private var banghui:FTextArea;
      
      private var yingxiong:FTextArea;
      
      private var Meng_bit:Bitmap;
      
      public function ChengChiList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 20;
         this.tf = new TextFormat();
         this.tf.align = "center";
         if(data.biaoshi % 2 == 1)
         {
            this.Meng_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
            this.Meng_bit.x = 0;
            this.Meng_bit.y = 0;
            this.Meng_bit.width = 385;
            this.Meng_bit.height = 20;
            addChild(this.Meng_bit);
         }
         this.chengchi = new FTextArea();
         addChild(this.chengchi);
         this.chengchi.multiline = true;
         this.chengchi.wordWrap = true;
         this.chengchi.width = 65 + 80;
         this.chengchi.height = 20;
         this.chengchi.x = 10 - 13;
         this.chengchi.y = 3;
         this.chengchi.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.name + " </font>";
         this.dengji = new FTextArea();
         addChild(this.dengji);
         this.dengji.multiline = true;
         this.dengji.wordWrap = true;
         this.dengji.width = 125;
         this.dengji.height = 20;
         this.dengji.x = 10 - 13 + 105;
         this.dengji.y = 3;
         this.dengji.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + this.getDengji(data.dengji) + " </font>";
         this.banghui = new FTextArea();
         addChild(this.banghui);
         this.banghui.wordWrap = true;
         this.banghui.width = 150 + 10 + 15 + 15;
         this.banghui.height = 20;
         this.banghui.x = 170 - 83 + 100;
         this.banghui.y = 3;
         this.banghui.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.banghui + " </font>";
         this.yingxiong = new FTextArea();
         addChild(this.yingxiong);
         this.yingxiong.wordWrap = true;
         this.yingxiong.width = 150 + 10 + 15 + 15;
         this.yingxiong.height = 20;
         this.yingxiong.x = 200 + 15 + 100 - 30;
         this.yingxiong.y = 3;
         this.yingxiong.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.yingxiong + " </font>";
      }
      
      private function getDengji(param1:int) : String
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
   }
}

