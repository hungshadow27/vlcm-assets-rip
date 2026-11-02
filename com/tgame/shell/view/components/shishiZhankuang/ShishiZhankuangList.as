package com.tgame.shell.view.components.shishiZhankuang
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class ShishiZhankuangList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var ft:FTextArea;
      
      private var line:Bitmap;
      
      private var Meng_bit:Bitmap;
      
      public function ShishiZhankuangList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 23;
         this.tf = new TextFormat();
         this.tf.align = "left";
         this.line = new Bitmap();
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.x = 4;
         this.line.y = 23;
         this.line.width = 515;
         addChild(this.line);
         if(data.ids)
         {
            this.Meng_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
            this.Meng_bit.x = 0;
            this.Meng_bit.y = 0;
            this.Meng_bit.width = 515;
            this.Meng_bit.height = 23;
            addChild(this.Meng_bit);
         }
         var _loc1_:int = 0;
         var _loc2_:String = "";
         if(data.nf == 1)
         {
            _loc1_ = StaticValue.BLUE;
            _loc2_ = LanResManager.getLanCommonTextWords("[宋]") + data.name;
         }
         else
         {
            _loc1_ = StaticValue.GREEN;
            _loc2_ = LanResManager.getLanCommonTextWords("[蒙]") + data.name;
         }
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 15;
         this.ft.y = 2;
         this.ft.textColor = _loc1_;
         this.ft.htmlText = _loc2_;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 165;
         this.ft.y = 2;
         this.ft.textColor = _loc1_;
         this.ft.htmlText = data.cishu;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 295;
         this.ft.y = 2;
         this.ft.textColor = _loc1_;
         this.ft.htmlText = data.shuliang;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 390;
         this.ft.y = 2;
         this.ft.textColor = _loc1_;
         this.ft.htmlText = data.jifen;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.filters = StaticValue.filter;
         this.ft.autoSize = TextFieldAutoSize.LEFT;
         this.ft.x = 465;
         this.ft.y = 2;
         this.ft.textColor = _loc1_;
         addChild(this.ft);
         if(data.zhuangtai == 0)
         {
            this.ft.htmlText = LanResManager.getLanCommonTextWords("死亡");
         }
         else
         {
            this.ft.htmlText = LanResManager.getLanCommonTextWords("战斗");
         }
      }
   }
}

