package com.tgame.moudels.banghui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.banghui.Banghui_ApplicationFacade;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Banghui_GongchengTimePanelMediator extends Mediator
   {
      
      public static const NAME:String = "Banghui_GongchengTimePanelMediator";
      
      private var _timeTextField:TextField;
      
      public function Banghui_GongchengTimePanelMediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Banghui_ApplicationFacade.ENTER_SCENE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Banghui_ApplicationFacade.ENTER_SCENE:
               if(GameConfig.wantEnterMapRes.isFuben != 2)
               {
                  this.clear_time();
                  if(GameInstance.uiInstance._popMapPanel != null)
                  {
                     PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_SHENLONGZHIREN,[OtherConst.SHENLONGZHIREN_REMOVE]);
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
      }
      
      private function uiHandle(param1:Event) : void
      {
      }
      
      public function receive_time(param1:Object = null) : void
      {
         if(this._timeTextField == null)
         {
            this._timeTextField = new TextField();
            this._timeTextField.mouseEnabled = false;
            this._timeTextField.x = 50;
            this._timeTextField.y = 100;
            this._timeTextField.autoSize = TextFieldAutoSize.LEFT;
            this._timeTextField.defaultTextFormat = new TextFormat(LanResManager.getLanCommonTextWords("宋体"),18,16777215);
            GameInstance.uiInstance.letterContainer.addChild(this._timeTextField);
         }
         var _loc2_:String = "";
         if(GameConfig.xiangyangcheng_banghuiID > 0)
         {
            _loc2_ = LanResManager.getLanTextWords(this,"游龙之刃位置",[StaticValue.YELLOW_HTML,param1.youlongzhirenX,param1.youlongzhirenY,StaticValue.YELLOW_HTML,param1.chiyouBangzhu,StaticValue.YELLOW_HTML,param1.chiyouShijian,StaticValue.YELLOW_HTML,param1.chiyouBanghui,StaticValue.RED_HTML,StaticValue.YELLOW_HTML,param1.tingliuShijian,StaticValue.RED_HTML,StaticValue.YELLOW_HTML,param1.shengyuJieshuShijian]);
            this._timeTextField.htmlText = _loc2_;
         }
         else
         {
            _loc2_ = LanResManager.getLanTextWords(this,"游龙之刃位置1",[StaticValue.YELLOW_HTML,param1.youlongzhirenX,param1.youlongzhirenY,StaticValue.YELLOW_HTML,StaticValue.YELLOW_HTML,param1.jianTingliuShijian,StaticValue.RED_HTML,StaticValue.YELLOW_HTML,param1.tingliuShijian,StaticValue.RED_HTML,StaticValue.YELLOW_HTML,param1.shengyuJieshuShijian]);
            this._timeTextField.htmlText = _loc2_;
         }
         PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_SHENLONGZHIREN,[OtherConst.SHENLONGZHIREN_ADD,new Point(param1.youlongzhirenX * 25,param1.youlongzhirenY * 25)]);
      }
      
      private function clear_time() : void
      {
         if(this._timeTextField != null)
         {
            if(this._timeTextField.parent)
            {
               this._timeTextField.parent.removeChild(this._timeTextField);
            }
            this._timeTextField = null;
         }
      }
   }
}

