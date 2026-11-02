package com.tgame.shell.view.components.attribute.tushidahui
{
   import com.tgame.moudels.tushidahui.view.info.TushidahuiVO;
   import com.tgame.shell.view.components.TargetAttribute;
   
   public class TushidahuiTargetController
   {
      
      private static var _instance:TushidahuiTargetController;
      
      private var _targetAttribute:TargetAttribute;
      
      private var _tushidahui:Tushidahui;
      
      public function TushidahuiTargetController()
      {
         super();
      }
      
      public static function get instance() : TushidahuiTargetController
      {
         if(!_instance)
         {
            _instance = new TushidahuiTargetController();
         }
         return _instance;
      }
      
      public function setup(param1:TargetAttribute, param2:Tushidahui) : void
      {
         this._targetAttribute = param1;
         this._tushidahui = param2;
      }
      
      public function show() : void
      {
         this._targetAttribute.initCharPanel(5,"2");
      }
      
      public function setInitData(param1:TushidahuiVO) : void
      {
         this._tushidahui.setInitialize(false,param1);
      }
      
      public function setEnableFun() : void
      {
         this._tushidahui.setEnableFun();
      }
   }
}

