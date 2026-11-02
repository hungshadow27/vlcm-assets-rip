package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextFormat;
   
   public class WangzhezhibangJifenPanel extends Sprite
   {
      
      private var ftTitle:FTextArea;
      
      private var giftList:FList;
      
      private var ftMy:FTextArea;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var container:Sprite;
      
      private var thisParent:DisplayObjectContainer;
      
      public function WangzhezhibangJifenPanel()
      {
         super();
         graphics.beginFill(0,0);
         graphics.drawRect(0,40,260,185);
         graphics.endFill();
         this.init();
      }
      
      private function init() : void
      {
         var title:DisplayObject;
         var tf:TextFormat;
         var title_bg:*;
         var my_bg:*;
         var line:Bitmap = null;
         var Title:FTextArea = null;
         var onAddToStage:Function = null;
         onAddToStage = function(param1:Event):void
         {
            removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            thisParent = parent;
         };
         var bg:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/jifen_bg.png",232,184);
         bg.x = 0;
         bg.y = 0;
         title = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/jifen_title.png",232,19);
         title.x = 0;
         title.y = 0;
         addChild(title);
         line = StaticValue.getBitmapByClassName("ui.line");
         line.x = 0;
         line.y = 19;
         line.width = 230;
         addChild(line);
         tf = new TextFormat();
         tf.align = "center";
         Title = new FTextArea();
         Title.defaultTextFormat = tf;
         Title.x = 0;
         Title.y = 2;
         Title.width = 230;
         Title.htmlText = "<font color=\'#CBE5CC\' size=\'14\'>" + LanResManager.getLanCommonTextWords("争霸战积分") + "</font>";
         addChild(Title);
         Title.addEventListener(MouseEvent.MOUSE_DOWN,this.onDrag);
         Title.addEventListener(MouseEvent.MOUSE_UP,this.onDrag);
         this.container = new Sprite();
         this.container.y = 20;
         addChild(this.container);
         title_bg = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         title_bg.x = 0;
         title_bg.y = 0;
         title_bg.width = 230;
         title_bg.height = 23;
         this.container.addChild(title_bg);
         this.ftTitle = new FTextArea();
         this.ftTitle.x = 10;
         this.ftTitle.y = 2;
         this.ftTitle.width = 230;
         this.ftTitle.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("排名") + "       " + LanResManager.getLanCommonTextWords("帮派名") + "           " + LanResManager.getLanCommonTextWords("积分") + "</font>";
         this.container.addChild(this.ftTitle);
         this.giftList = new FList();
         this.giftList.skin = "list";
         this.giftList.itemRenderer = new WangzhezhibangJifenRanader();
         this.giftList.listWidth = 220;
         this.container.addChild(this.giftList);
         this.giftList.x = 0;
         this.giftList.y = 20;
         this.giftList.mouseChildren = false;
         my_bg = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
         my_bg.x = 0;
         my_bg.y = 140;
         my_bg.width = 230;
         my_bg.height = 23;
         this.container.addChild(my_bg);
         this.ftMy = new FTextArea();
         this.ftMy.x = 10;
         this.ftMy.y = 143;
         this.ftMy.htmlText = "";
         this.ftMy.width = 210;
         this.container.addChild(this.ftMy);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "subButton";
         addChild(this.addBtn);
         this.addBtn.x = 235;
         this.addBtn.y = 1;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "sumButton";
         addChild(this.subBtn);
         this.subBtn.x = 235;
         this.subBtn.y = 1;
         this.subBtn.visible = false;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
      }
      
      private function onDrag(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - 205,Tools.currentStage.stageHeight - 240));
               this.cacheAsBitmap = true;
               param1.updateAfterEvent();
               break;
            case MouseEvent.MOUSE_UP:
               this.cacheAsBitmap = false;
               stopDrag();
         }
      }
      
      private function onMove(param1:Event) : void
      {
         if(Tools.currentStage.mouseX < 0 || Tools.currentStage.mouseX > Tools.currentStage.stageWidth || Tools.currentStage.mouseY < 0 || Tools.currentStage.mouseY > Tools.currentStage.stageHeight)
         {
            stopDrag();
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.addBtn:
               this.fold(true);
               break;
            case this.subBtn:
               this.fold(false);
         }
      }
      
      public function fold(param1:Boolean) : void
      {
         if(param1)
         {
            this.addBtn.visible = false;
            this.subBtn.visible = true;
            if(this.container.parent != null)
            {
               this.container.parent.removeChild(this.container);
            }
            graphics.clear();
         }
         else
         {
            this.addBtn.visible = true;
            this.subBtn.visible = false;
            if(this.container.parent != this)
            {
               this.addChildAt(this.container,1);
            }
            graphics.beginFill(0,0);
            graphics.drawRect(0,40,230,165);
            graphics.endFill();
         }
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         this.giftList.dataProvider = param1;
         this.ftMy.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("我的帮派积分：") + "   " + param2 + "</font>";
      }
   }
}

