package com.tgame.common.ui.componets
{
   import com.fireice.util.Tools;
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import game.display.Panel;
   
   public class BasePanel extends Panel
   {
      
      public static var useClostEffect:Boolean = false;
      
      public static const Close_by_keyBoard:String = "ByKeyBoard";
      
      private var _isCloseEffect:Boolean;
      
      private var $this:DisplayObject;
      
      private var _panelWidth:Number;
      
      private var _panelHeight:Number;
      
      public function BasePanel()
      {
         super();
         this.$this = this;
         this._isCloseEffect = useClostEffect;
      }
      
      public function set isCloseEffect(param1:Boolean) : void
      {
         this._isCloseEffect = param1;
      }
      
      public function get isCloseEffect() : Boolean
      {
         return this._isCloseEffect;
      }
      
      public function onClose(param1:* = null) : void
      {
         if(this._isCloseEffect)
         {
            TweenLite.to(this,0.5,{
               "alpha":0,
               "onComplete":this.onCom
            });
         }
         else
         {
            Tools.currentStage.stage.focus = Tools.currentStage.stage;
            if(parent)
            {
               parent.removeChild(this);
            }
         }
      }
      
      private function onCom() : void
      {
         this.alpha = 1;
         Tools.currentStage.stage.focus = Tools.currentStage.stage;
         if(this.$this.parent)
         {
            this.$this.parent.removeChild(this);
         }
      }
      
      public function get panelWidth() : Number
      {
         return skin.width;
      }
      
      public function get panelHeight() : Number
      {
         return skin.height;
      }
      
      override public function set width(param1:Number) : void
      {
         this._panelWidth = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         this._panelHeight = param1;
      }
   }
}

