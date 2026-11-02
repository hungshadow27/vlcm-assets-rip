package com.tgame.shell.view.components.attribute.niaoxiangzhen
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.niaoxiangzhen.model.info.NiaoXiangZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   
   public class NiaoXiangZhenController
   {
      
      private static var _instance:NiaoXiangZhenController;
      
      private var _charAttribute:CharAttribute;
      
      private var _niaoXiangZhen:NiaoXiangZhen;
      
      public function NiaoXiangZhenController()
      {
         super();
      }
      
      public static function get instance() : NiaoXiangZhenController
      {
         if(!_instance)
         {
            _instance = new NiaoXiangZhenController();
         }
         return _instance;
      }
      
      public function setup(param1:CharAttribute, param2:NiaoXiangZhen) : void
      {
         this._charAttribute = param1;
         this._niaoXiangZhen = param2;
      }
      
      public function requestShowNiaoXiangZhen() : void
      {
         this._charAttribute.dispatchEvent(new BaseEvent(NiaoXiangZhenConst.NIAOXIANGZHEN));
      }
      
      public function showNiaoXiangZhen() : void
      {
         this._charAttribute.initCharPanel(4,"22");
      }
      
      public function setNiaoXiangZhenInitialize(param1:NiaoXiangZhenVO) : void
      {
         this._niaoXiangZhen.setInitialize(true,param1);
      }
      
      public function setNiaoXiangJiHuo(param1:Boolean) : void
      {
         this._niaoXiangZhen.setJiHuo(param1);
      }
      
      public function setNiaoXiangZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this._niaoXiangZhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setNiaoXiangZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this._niaoXiangZhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setNiaoXiangZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this._niaoXiangZhen.setGoods(param1,param2);
      }
      
      public function setNiaoXiangZhenLingwuBtn(param1:Boolean) : void
      {
         this._niaoXiangZhen.setTuPoBtn(param1);
      }
      
      public function showNiaoXiangZhenLingWuPanel(param1:Boolean) : void
      {
         this._niaoXiangZhen.showTuPoPanel(param1);
      }
      
      public function isNiaoXiangZhentupoCanvasShow() : Boolean
      {
         return this._niaoXiangZhen.isTupoCanvasShow();
      }
   }
}

