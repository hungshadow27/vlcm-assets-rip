package com.tgame.shell.view.components.moshouzhanchang
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.shell.view.components.MainUI;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.skin.moshouzhanchang20180726Skin;
   import game.utils.SkinTools;
   
   public class MoShouZhanChangFuHuoPanel extends BasePanel
   {
      
      public var _parent:DisplayObject;
      
      private var btnFuHuo:SimpleButton;
      
      private var txtFuHuo:Label;
      
      private var currTimer:int;
      
      public function MoShouZhanChangFuHuoPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(moshouzhanchang20180726Skin.skin,"siwangtishixiaojiemian");
      }
      
      override protected function createVariableReference() : void
      {
         this.btnFuHuo = getChildByName("fanhuifuhuodiananniu") as SimpleButton;
         this.btnFuHuo.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.txtFuHuo = getChildByName("anniuzi") as Label;
         this.txtFuHuo.mouseEnabled = false;
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new Event(MainUI.MOSHOUZHANCHANG_FUHUO_CLICK));
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setMoShouZhanChangFuHuoData() : void
      {
         this.currTimer = 16;
         this.txtFuHuo.htmlText = "返回复活点(" + this.currTimer + "秒)";
         setTimeout(this.setTimeoutHandler,1000);
      }
      
      private function setTimeoutHandler() : void
      {
         if(this.currTimer > 0)
         {
            --this.currTimer;
            this.txtFuHuo.htmlText = "返回复活点(" + this.currTimer + "秒)";
            setTimeout(this.setTimeoutHandler,1000);
         }
         else if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

