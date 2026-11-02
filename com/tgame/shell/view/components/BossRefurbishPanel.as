package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.shell.view.components.BossRefurbish.BossRefurbishList;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.*;
   
   public class BossRefurbishPanel extends Sprite
   {
      
      public static const UI_BOSSREFURBISH_LIST:String = "UI_BOSSREFURBISH_LIST";
      
      public static const UI_BOSSREFURBISH_SUB:String = "UI_BOSSREFURBISH_SUB";
      
      public static const UI_BOSSREFURBISH_MAP_CLICK:String = "UI_BOSSREFURBISH_MAP_CLICK";
      
      public static const UI_BOSSREFURBISH_PIP_CLICK:String = "UI_BOSSREFURBISH_PIP_CLICK";
      
      private var lb:FLabel;
      
      private var listContainer:Sprite;
      
      private var giftList:FList;
      
      private var subBtn:SecondButton;
      
      private var Scroll:FVScorllBar;
      
      private var giftListArr:Array;
      
      private var sycDj:int = -1;
      
      private var listContainer2:Sprite;
      
      private var Scroll2:FVScorllBar;
      
      private var ft1:FTextArea;
      
      private var menuCanvas:FCanvas;
      
      private var menuList:FList;
      
      private var partId:int;
      
      private var partName:String;
      
      private var _parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var _avatar:Bitmap;
      
      private var barSpr:Sprite;
      
      private var bar:ColorBar;
      
      private var gradeFta:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function BossRefurbishPanel()
      {
         var dis:DisplayObject;
         var ft:FTextArea;
         var barBg1:Bitmap;
         var bg:Bitmap = null;
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         dis = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/boss/bg.swf");
         addChild(dis);
         ft = new FTextArea();
         with(ft)
         {
            x = 150;
            y = 5;
            wordWrap = true;
            width = 450;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE50;
            htmlText = LanResManager.getLanTextWords(this,"野外BOSS名称");
         }
         addChild(ft);
         this._avatar = new Bitmap();
         addChild(this._avatar);
         bg = StaticValue.getBitmapByClassName("ui.anqi.kuang");
         bg.x = 10;
         bg.y = 5;
         addChild(bg);
         this.gradeFta = new FTextArea();
         with(this.gradeFta)
         {
            x = 10;
            y = 135;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.RED;
            visible = false;
         }
         this.barSpr = new Sprite();
         this.barSpr.x = 10;
         this.barSpr.y = 153;
         this.barSpr.visible = false;
         this.barSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onBarTips);
         this.barSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onBarTips);
         barBg1 = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.bar = new ColorBar(1,123,5);
         this.bar.x = barBg1.x + 4;
         this.bar.y = barBg1.y + 3;
         this.bar.setValue(50,100);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 150;
            y = 30;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,415,305);
            graphics.endFill();
         }
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new BossRefurbishList();
         this.giftList.listWidth = 415;
         this.listContainer.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 0;
         this.giftList.addEventListener(MouseEvent.CLICK,this.onListClick);
         addEventListener(UI_BOSSREFURBISH_PIP_CLICK,this.onListPipClick);
         this.Scroll = new FVScorllBar(this.listContainer,305);
         addChild(this.Scroll);
         this.Scroll.x = 570;
         this.Scroll.y = 30;
         this.menuCanvas = new FCanvas();
         this.menuCanvas.skin = "backGroud";
         this.menuList = new FList();
         this.menuList.skin = "menuList";
         this.menuCanvas.addChild(this.menuList);
         this.menuList.x = 2;
         this.menuList.y = 2;
         this.menuList.listWidth = 30;
         this.menuList.dataProvider = <list>
															<node label={LanResManager.getLanCommonTextWords("查看")} id="2"/>
															<node label={LanResManager.getLanCommonTextWords("密聊")} id="1"/>
														</list>;
         this.menuList.addEventListener(MouseEvent.CLICK,this.onList);
         this.menuCanvas.width = this.menuList.width + 4;
         this.menuCanvas.height = this.menuList.height + 4;
         this.listContainer2 = new Sprite();
         addChild(this.listContainer2);
         with(this.listContainer2)
         {
            x = 10;
            y = 170;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,115,165);
            graphics.endFill();
         }
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 0;
            y = 0;
            wordWrap = true;
            width = 115;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE50;
            htmlText = "";
         }
         this.listContainer2.addChild(this.ft1);
         this.Scroll2 = new FVScorllBar(this.listContainer2,165);
         addChild(this.Scroll2);
         this.Scroll2.x = 125;
         this.Scroll2.y = 170;
      }
      
      private function onStageClick(param1:MouseEvent = null) : void
      {
         if(this.menuCanvas.parent != null)
         {
            this.menuCanvas.parent.removeChild(this.menuCanvas);
         }
         Tools.currentStage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onList(param1:MouseEvent) : void
      {
         this.onStageClick();
         this._parent.dispatchEvent(new BaseEvent(GiftPanel.CHAT_MENU_CLICK,"",[int(this.menuList.selectItem.id),this.partId,this.partName]));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function onListPipClick(param1:BaseEvent) : void
      {
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         if(this.giftList.selectItem == null)
         {
            return;
         }
         this._parent.dispatchEvent(new BaseEvent(GiftPanel.UI_CONQUERPANEL_BOSS_LIST_CLICK,"",int(this.giftList.selectItem.id)));
         var _loc2_:String = "";
         _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"【当前状态】") + "</font><br>";
         if(this.giftList.selectItem.blood == 0)
         {
            _loc2_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"【等待刷新】") + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"下轮时间") + this.giftList.selectItem.time + "</font><br>";
         }
         else
         {
            _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"【已刷新】") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"血量剩余") + this.giftList.selectItem.blood + "%</font><br>";
         }
         _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"【武功介绍】") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>【" + this.giftList.selectItem.skill + "】</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"【爆率介绍】") + "</font><br>" + "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + this.giftList.selectItem.particular + "</font>" + "</textformat>";
         this.ft1.htmlText = _loc2_;
         this.Scroll2.update();
         this.partId = this.giftList.selectItem.pipId;
         this.partName = this.giftList.selectItem.pip;
         if(this.giftList.selectItem.pip != "" && param1.target is FTextArea && param1.target.name == "_pip" && this.giftList.selectItem.isOnLine == 1)
         {
            if(param1.type == MouseEvent.CLICK)
            {
               param1.stopPropagation();
               this.showMenu();
            }
            else
            {
               GameInstance.scene.sceneDispatchEvent(param1);
            }
         }
      }
      
      private function showMenu() : void
      {
         Tools.currentStage.addChild(this.menuCanvas);
         this.menuCanvas.x = Tools.currentStage.mouseX;
         this.menuCanvas.y = Tools.currentStage.mouseY;
         Tools.currentStage.addEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function giftListTaxis(param1:BaseEvent) : void
      {
      }
      
      public function SetInitialize(param1:Array) : void
      {
         this.avatar = null;
         this.giftList.dataProvider = param1;
         this.Scroll.update();
         this.ft1.htmlText = "";
         this.barSpr.visible = false;
         this.gradeFta.htmlText = "";
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.scaleX = this._avatar.scaleY = 1;
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         var _loc2_:Number = 1;
         if(this._avatar.height != 110)
         {
            _loc2_ = 110 / this._avatar.height;
         }
         var _loc3_:Rectangle = this._avatar.bitmapData.getColorBoundsRect(4278190080,0,false);
         this._avatar.bitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         this._avatar.bitmapData.copyPixels(param1,_loc3_,new Point(0,0));
         var _loc4_:Number = 1;
         if(_loc3_.width > 115)
         {
            _loc4_ = 115 / _loc3_.width;
         }
         this._avatar.scaleX = this._avatar.scaleY = _loc2_ > _loc4_ ? _loc4_ : _loc2_;
         this._avatar.x = 72 - this._avatar.width / 2;
         this._avatar.y = 73 - this._avatar.height / 2;
      }
      
      private function onBarTips(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.barSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onBarTips);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("BOSS每死亡一次，增加1点戾气。") + "<br>" + LanResManager.getLanCommonTextWords("每10点戾气会提升BOSS的暴戾等级1级") + "<br>" + LanResManager.getLanCommonTextWords("暴戾等级提升后，BOSS各属性随之加强") + "<br>" + LanResManager.getLanCommonTextWords("若下次刷新BOSS之前，BOSS未被击杀，减少1点戾气") + "<br>" + "</font>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.barSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onBarTips);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
   }
}

