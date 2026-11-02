package com.tgame.shell.view.components.moshouzhanchang
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   import flash.text.TextFormat;
   import flash.utils.setTimeout;
   
   public class MoShouZhanChangJiangLiPanel extends BasePanel
   {
      
      public var _parent:DisplayObject;
      
      private var txtTime:FTextArea;
      
      private var currTime:int = 0;
      
      public function MoShouZhanChangJiangLiPanel()
      {
         super();
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.size = 15;
         this.txtTime = new FTextArea();
         this.txtTime.defaultTextFormat = _loc1_;
         this.txtTime.textColor = StaticValue.RED;
         this.txtTime.width = 130;
         this.txtTime.height = 20;
         this.txtTime.htmlText = "00:00:00";
         addChild(this.txtTime);
      }
      
      public function setMoShouZhanChangJiangLiData(param1:Object) : void
      {
         if(!this.currTime)
         {
            this.currTime = param1.time;
            setTimeout(this.setTimeOutHandler,1000);
         }
      }
      
      public function setTimeOutHandler() : void
      {
         if(this.currTime > 0)
         {
            this.txtTime.htmlText = Math.floor(this.currTime / 3600) + ":" + Math.floor(this.currTime % 3600 / 60) + ":" + Math.floor(this.currTime % 3600 % 60);
            --this.currTime;
            setTimeout(this.setTimeOutHandler,1000);
         }
         else
         {
            this.txtTime.htmlText = "00:00:00";
         }
      }
   }
}

