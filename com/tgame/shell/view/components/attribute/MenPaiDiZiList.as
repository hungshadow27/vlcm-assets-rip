package com.tgame.shell.view.components.attribute
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class MenPaiDiZiList extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public static var isMain:Boolean = true;
      
      private var mingzi:FTextArea;
      
      private var siw:FTextArea;
      
      private var head:Bitmap;
      
      private var chaKanBtn:SmallButton;
      
      private var chuZhanDisObj:DisplayObject;
      
      private var colorBarBg:Bitmap;
      
      private var skillBar:ColorBar;
      
      public function MenPaiDiZiList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc2_:FTextArea = null;
         var _loc3_:FTextArea = null;
         _height = 71;
         var _loc1_:String = HeadResChange.headResChangeToString(data.headImg);
         this.head = new Bitmap();
         addChild(this.head);
         this.head.x = 5;
         this.head.y = 5;
         this.head.bitmapData = StaticValue.getBitmapByClassName(_loc1_).bitmapData;
         this.head.width = this.head.height = 60;
         this.mingzi = new FTextArea();
         this.mingzi.multiline = true;
         this.mingzi.filters = StaticValue.filter;
         this.mingzi.width = 100;
         this.mingzi.height = 60;
         this.mingzi.x = 80;
         this.mingzi.y = 15;
         this.mingzi.textColor = StaticValue.ORANGE;
         addChild(this.mingzi);
         this.mingzi.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("名称：") + data.name + "</font>";
         _loc2_ = new FTextArea();
         _loc2_.multiline = true;
         _loc2_.filters = StaticValue.filter;
         _loc2_.width = 100;
         _loc2_.height = 60;
         _loc2_.x = 200;
         _loc2_.y = 15;
         _loc2_.textColor = StaticValue.ORANGE;
         addChild(_loc2_);
         _loc2_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("等级：") + data.grade + "</font>";
         _loc3_ = new FTextArea();
         _loc3_.multiline = true;
         _loc3_.filters = StaticValue.filter;
         _loc3_.width = 100;
         _loc3_.height = 60;
         _loc3_.x = 80;
         _loc3_.y = 15 + 20;
         _loc3_.textColor = StaticValue.ORANGE;
         addChild(_loc3_);
         _loc3_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功：") + "</font>";
         this.colorBarBg = StaticValue.getBitmapByClassName("ui.char.attribute.colorBar.bg");
         addChild(this.colorBarBg);
         this.colorBarBg.x = 120;
         this.colorBarBg.y = 38;
         this.colorBarBg.width = 165;
         this.skillBar = new ColorBar(2,154,5);
         addChild(this.skillBar);
         this.skillBar.x = this.colorBarBg.x + 4;
         this.skillBar.y = this.colorBarBg.y + 3;
         this.skillBar.setValue(data.wuGong,data.wuGongMax);
         this.setchu();
      }
      
      private function setchu() : void
      {
         if(data.isChuZhan)
         {
            this.chuZhanDisObj = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shicong/chuzhanzhong.swf");
            this.chuZhanDisObj.x = 15;
            this.chuZhanDisObj.y = 45;
            addChild(this.chuZhanDisObj);
            if(isMain)
            {
               this.chaKanBtn = new SmallButton();
               this.chaKanBtn.label = LanResManager.getLanCommonTextWords("查看");
               addChild(this.chaKanBtn);
               this.chaKanBtn.x = 270;
               this.chaKanBtn.y = 15;
               this.chaKanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
            }
         }
         if(!data.isDead)
         {
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(isMain)
         {
            $parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDEMENPAI_CHAKAN_CLICK,"",data.id));
         }
      }
   }
}

