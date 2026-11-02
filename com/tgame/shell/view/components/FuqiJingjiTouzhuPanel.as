package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class FuqiJingjiTouzhuPanel extends Sprite
   {
      
      public static const UI_FUQIJINGJI_XIAZHU_CLICK:String = "UI_FUQIJINGJI_XIAZHU_CLICK";
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var container:FuqiJingjiTouzhuContainer;
      
      public function FuqiJingjiTouzhuPanel()
      {
         super();
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "subButton";
         addChild(this.addBtn);
         this.addBtn.x = 0;
         this.addBtn.y = 0;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "sumButton";
         addChild(this.subBtn);
         this.subBtn.x = 0;
         this.subBtn.y = 0;
         this.subBtn.visible = false;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.container = new FuqiJingjiTouzhuContainer();
         this.container.x = 18;
         this.container.y = 0;
         addChild(this.container);
         this.container.visible = true;
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
      
      private function fold(param1:Boolean) : void
      {
         if(param1)
         {
            this.addBtn.visible = false;
            this.subBtn.visible = true;
            this.container.visible = false;
         }
         else
         {
            this.addBtn.visible = true;
            this.subBtn.visible = false;
            this.container.visible = true;
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.container.$parent = param1;
      }
      
      public function setXiazhuNum(param1:int) : void
      {
         this.container.setXiazhuNum(param1);
      }
      
      public function setXiazhuBaoshi(param1:Array) : void
      {
         this.container.setXiazhuBaoshi(param1);
      }
   }
}

