package com.tgame.shell.view.components.mainui
{
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   import flash.utils.Timer;
   import gs.TweenMax;
   
   public class YNHuodongTip extends Sprite
   {
      
      private static var type:int = -1;
      
      public var $parent:DisplayObject;
      
      private var huodongContainer:Sprite;
      
      private var time:Timer;
      
      private var djs:int = 20;
      
      public function YNHuodongTip()
      {
         super();
      }
      
      public function setActiveHodong(param1:int, param2:String) : void
      {
         var bg:DisplayObject;
         var lb:FTextArea;
         var id:int = param1;
         var hdName:String = param2;
         type = id;
         this.huodongContainer = new Sprite();
         with(this.huodongContainer.graphics)
         {
            drawRect(0,0,181,109);
            endFill();
         }
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/ynHuodong/" + id + ".swf");
         this.huodongContainer.addChild(bg);
         lb = new FTextArea();
         with(lb)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = (huodongContainer.width - lb.width) / 2;
            y = huodongContainer.height - 100;
            textColor = StaticValue.YELLOW;
            htmlText = hdName + LanResManager.getLanCommonTextWords("活动已经开启!");
         }
         this.huodongContainer.addChild(lb);
         this.huodongContainer.x = 50;
         this.huodongContainer.y = (GameConfig.sceneHeight - this.huodongContainer.height) / 2;
         this.huodongContainer.name = String(id);
         GameInstance.uiInstance.uiContainer.addChild(this.huodongContainer);
         this.huodongContainer.addEventListener(MouseEvent.CLICK,this.onClick);
         TweenMax.to(this.huodongContainer,5,{"x":(GameConfig.sceneWidth - this.huodongContainer.width) / 2});
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.huodongContainer:
               PipeManager.sendMsg(PipeConstants.YN_YUENANHUODONGYOUHUA_CLICK,param1.target.name);
               if(Boolean(param1.target) && Boolean(param1.target.parent))
               {
                  param1.target.parent.removeChild(param1.target);
               }
               break;
            default:
               PipeManager.sendMsg(PipeConstants.YN_YUENANHUODONGYOUHUA_CLICK,param1.target.parent.name);
               if(Boolean(param1.target.parent) && Boolean(param1.target.parent.parent))
               {
                  param1.target.parent.parent.removeChild(param1.target.parent);
               }
         }
      }
   }
}

