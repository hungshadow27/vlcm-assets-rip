package com.tgame.shell.view.components.attribute.tushidahui
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiChuangGuanVO;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.utils.ByteArray;
   
   public class TushidahuiController
   {
      
      private static var _instance:TushidahuiController;
      
      private var _attribute:CharAttribute;
      
      private var _tushidahui:Tushidahui;
      
      public function TushidahuiController()
      {
         super();
      }
      
      public static function get instance() : TushidahuiController
      {
         if(!_instance)
         {
            _instance = new TushidahuiController();
         }
         return _instance;
      }
      
      public function setup(param1:CharAttribute, param2:Tushidahui) : void
      {
         this._attribute = param1;
         this._tushidahui = param2;
      }
      
      public function switchOpenOnEnter(param1:Array, param2:int, param3:int) : void
      {
         if(param1[0] != 2051)
         {
            return;
         }
         var _loc4_:Boolean = Boolean(param1[2] == 1);
         if(_loc4_)
         {
            if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
            }
            this.show();
            this.request();
            GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
         }
         GameState["gongneng" + param2] = param3 == 1;
         GameInstance.uiInstance.charAttribute.permitTushidahui(param1[1] == 1);
      }
      
      public function switchOpenOnline(param1:int, param2:int, param3:ByteArray) : void
      {
         if(param1 != 2051)
         {
            return;
         }
         var _loc4_:Boolean = Boolean(param3.readByte() == 1);
         if(_loc4_)
         {
            if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
            }
            this.show();
            this.request();
            GameInstance.uiInstance.charAttribute.parent.setChildIndex(GameInstance.uiInstance.charAttribute,GameInstance.uiInstance.charAttribute.parent.numChildren - 1);
         }
         GameState["gongneng" + param1] = param2 == 1;
         GameInstance.uiInstance.charAttribute.permitTushidahui(param2 == 1);
      }
      
      public function request() : void
      {
         this._attribute.dispatchEvent(new BaseEvent(TushidahuiConst.TUSHIDAHUI));
      }
      
      public function show() : void
      {
         this._attribute.initCharPanel(5,"2");
      }
      
      public function showTupoPanel(param1:Boolean = true) : void
      {
         this._tushidahui.showTupoPanel(param1);
      }
      
      public function setInitData(param1:TushidahuiVO) : void
      {
         this._tushidahui.setInitialize(true,param1);
      }
      
      public function setChuangGuanData(param1:TushidahuiChuangGuanVO) : void
      {
         this._tushidahui.setChuangGuanData(param1);
      }
      
      public function setTupoBtn(param1:Boolean) : void
      {
         this._tushidahui.setTuPoBtn(param1);
      }
      
      public function setBless(param1:int, param2:int, param3:int = 0) : void
      {
         this._tushidahui.setZhufuzhi(param1,param2,param3);
      }
      
      public function get tupoCanvasIsShow() : Boolean
      {
         return this._tushidahui.isTupoCanvasShow();
      }
   }
}

