package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class TaskTrack extends Sprite
   {
      
      private var currentBtn:Sprite;
      
      private var ableBtn:Sprite;
      
      private var chengjiuBtn:Sprite;
      
      private var current_up:Bitmap;
      
      private var current_down:Bitmap;
      
      private var able_up:Bitmap;
      
      private var able_down:Bitmap;
      
      private var chengjiu_up:Bitmap;
      
      private var chengjiu_down:Bitmap;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var container:Sprite;
      
      public var listContainer:Sprite;
      
      public var obj:DisplayObject;
      
      private var scroll:FVScorllBar;
      
      private var title:Sprite;
      
      private var thisParent:DisplayObjectContainer;
      
      public function TaskTrack()
      {
         var onAddToStage:Function = null;
         onAddToStage = function(param1:Event):void
         {
            removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            thisParent = parent;
         };
         super();
         graphics.beginFill(0,0.5);
         graphics.drawRect(0,40,183,198);
         graphics.endFill();
         this.title = new Sprite();
         addChild(this.title);
         this.title.addChild(StaticValue.getBitmapByClassName("ui.main.task.title"));
         this.title.addEventListener(MouseEvent.MOUSE_DOWN,this.onDrag);
         this.title.addEventListener(MouseEvent.MOUSE_UP,this.onDrag);
         Tools.currentStage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMove);
         this.currentBtn = new Sprite();
         addChild(this.currentBtn);
         this.currentBtn.buttonMode = true;
         this.currentBtn.x = 10 - 5;
         this.currentBtn.y = 20;
         this.currentBtn.addEventListener(MouseEvent.CLICK,this.onCurrent);
         this.ableBtn = new Sprite();
         addChild(this.ableBtn);
         this.ableBtn.buttonMode = true;
         this.ableBtn.x = 70 - 10;
         this.ableBtn.y = 20;
         this.ableBtn.addEventListener(MouseEvent.CLICK,this.onAble);
         this.chengjiuBtn = new Sprite();
         addChild(this.chengjiuBtn);
         this.chengjiuBtn.buttonMode = true;
         this.chengjiuBtn.x = 135 - 10;
         this.chengjiuBtn.y = 20;
         this.chengjiuBtn.addEventListener(MouseEvent.CLICK,this.onChengjiu);
         this.current_down = StaticValue.getBitmapByClassName("ui.main.button.currentTask.down");
         this.currentBtn.addChild(this.current_down);
         this.current_down.visible = true;
         this.current_up = StaticValue.getBitmapByClassName("ui.main.button.currentTask.up");
         this.currentBtn.addChild(this.current_up);
         this.current_up.visible = false;
         this.able_down = StaticValue.getBitmapByClassName("ui.main.button.ableTask.down");
         this.ableBtn.addChild(this.able_down);
         this.able_down.visible = false;
         this.able_up = StaticValue.getBitmapByClassName("ui.main.button.ableTask.up");
         this.ableBtn.addChild(this.able_up);
         this.able_up.visible = true;
         this.chengjiu_down = StaticValue.getBitmapByClassName("ui.main.tasktrack.button.chengjiu.down");
         this.chengjiuBtn.addChild(this.chengjiu_down);
         this.chengjiu_down.visible = false;
         this.chengjiu_up = StaticValue.getBitmapByClassName("ui.main.tasktrack.button.chengjiu.up");
         this.chengjiuBtn.addChild(this.chengjiu_up);
         this.chengjiu_up.visible = true;
         this.currentBtn.addEventListener(MouseEvent.CLICK,this.onChange);
         this.ableBtn.addEventListener(MouseEvent.CLICK,this.onChange);
         this.chengjiuBtn.addEventListener(MouseEvent.CLICK,this.onChange);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "subButton";
         addChild(this.addBtn);
         this.addBtn.x = 183;
         this.addBtn.y = 1;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "sumButton";
         addChild(this.subBtn);
         this.subBtn.x = 183;
         this.subBtn.y = 1;
         this.subBtn.visible = false;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.container = new Sprite();
         addChild(this.container);
         this.listContainer = new Sprite();
         with(this.listContainer)
         {
            graphics.beginFill(0,0);
            graphics.drawRect(0,0,183,198);
            graphics.endFill();
            y = 40;
         }
         this.listContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouse);
         this.listContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouse);
         this.container.addChild(this.listContainer);
         this.scroll = new FVScorllBar(this.listContainer,198);
         addChild(this.scroll);
         this.scroll.x = 187;
         this.scroll.y = 40;
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
      
      private function onMouse(param1:MouseEvent) : void
      {
         if(param1.target is TextField)
         {
            return;
         }
         GameInstance.scene.sceneDispatchEvent(param1);
      }
      
      private function onChange(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.currentBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.TASK_TRACK_ACCEPTEDLIST_CLICK));
               break;
            case this.ableBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.TASK_TRACK_ACCEPTABLELIST_CLICK));
               break;
            case this.chengjiuBtn:
               parent.dispatchEvent(new BaseEvent(MainUI.TASK_TRACK_CHENGJIU_CLICK));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(ReloginManager.isInKuafu)
         {
            NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
            return;
         }
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
            if(this.scroll.parent)
            {
               this.scroll.parent.removeChild(this.scroll);
            }
         }
         else
         {
            this.addBtn.visible = true;
            this.subBtn.visible = false;
            if(this.container.parent != this)
            {
               this.addChildAt(this.container,0);
            }
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,40,183,198);
            graphics.endFill();
            addChild(this.scroll);
         }
      }
      
      public function showHide(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.thisParent != null && this.parent == null)
            {
               this.thisParent.addChild(this);
               this.onCurrent();
               parent.dispatchEvent(new BaseEvent(MainUI.TASK_TRACK_ACCEPTEDLIST_CLICK));
            }
         }
         else if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onCurrent(param1:MouseEvent = null) : void
      {
         if(this.current_down.visible == true)
         {
            return;
         }
         this.current_up.visible = false;
         this.current_down.visible = true;
         this.able_up.visible = true;
         this.able_down.visible = false;
         this.chengjiu_up.visible = true;
         this.chengjiu_down.visible = false;
      }
      
      private function onAble(param1:MouseEvent) : void
      {
         if(this.able_down.visible == true)
         {
            return;
         }
         this.current_up.visible = true;
         this.current_down.visible = false;
         this.able_up.visible = false;
         this.able_down.visible = true;
         this.chengjiu_up.visible = true;
         this.chengjiu_down.visible = false;
      }
      
      private function onChengjiu(param1:MouseEvent) : void
      {
      }
      
      public function setTrack(param1:DisplayObject) : void
      {
         if(this.obj != param1)
         {
            this.obj = param1;
            while(this.listContainer.numChildren > 0)
            {
               this.listContainer.removeChildAt(0);
            }
            this.listContainer.addChild(this.obj);
            this.scroll.update();
         }
      }
      
      public function scrollUpdate(param1:Boolean) : void
      {
         this.scroll.update(param1);
      }
   }
}

