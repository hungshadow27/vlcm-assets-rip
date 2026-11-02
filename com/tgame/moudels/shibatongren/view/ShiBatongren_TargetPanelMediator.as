package com.tgame.moudels.shibatongren.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shibatongren.model.ShiBaTongRen_MsgSenderProxy;
   import com.tgame.moudels.shibatongren.model.info.ShiBaTongRenMainPanelVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShiBatongren_TargetPanelMediator extends Mediator
   {
      
      private static var _tongrenVO:ShiBaTongRenMainPanelVO;
      
      public static const NAME:String = "ShiBatongren_TargetPanelMediator";
      
      private var _senderProxy:ShiBaTongRen_MsgSenderProxy;
      
      public function ShiBatongren_TargetPanelMediator()
      {
         super(NAME);
      }
      
      public static function get tongrenVO() : ShiBaTongRenMainPanelVO
      {
         if(!_tongrenVO)
         {
            _tongrenVO = new ShiBaTongRenMainPanelVO();
         }
         return _tongrenVO;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get senderProxy() : ShiBaTongRen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ShiBaTongRen_MsgSenderProxy.NAME) as ShiBaTongRen_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.SHIBATONGREN,requestTargetInfoHander);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.SHIBATONGREN,requestTargetInfoHander);
         });
      }
      
      private function requestTargetInfoHander(param1:Event) : void
      {
         ShiBatongren_PanelMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_54501({
            "userID":GameInstance.lookPlayerID,
            "skillID":0
         });
      }
      
      public function initializeMainUI() : void
      {
         this.selectYNequip();
         this.targetArrtibutePlane.showShiBaTongRen();
         this.targetArrtibutePlane.initilizeShiBaTongRenUI(tongrenVO);
         this.targetArrtibutePlane.setCHK_LSSH(tongrenVO.YN_QixuanState);
         this.targetArrtibutePlane.showYN_LSSH(tongrenVO.YN_Qixuan);
         this.targetArrtibutePlane.setXunzhangYN_SBTRZ(this.selectXunzhang());
         this.targetArrtibutePlane.showYNequipselect();
         this.targetArrtibutePlane.showSelectJianBarSBTR();
      }
      
      public function selectXunzhang() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = GameInstance.lookPlayerID;
         var _loc3_:Array = GameInstance.lookPlayerData.goodsInfo.goodsBagArr;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(_loc3_[_loc4_].res.position == ItemPositionRange.POSITION_LONGSHENSHOUHU)
            {
               _loc1_.push(_loc3_[_loc4_]);
            }
            if(_loc3_[_loc4_].res.position == ItemPositionRange.POSTION_20171115ZHIZUNBAQI)
            {
               _loc1_.push(_loc3_[_loc4_]);
            }
            _loc4_++;
         }
         return _loc1_;
      }
      
      private function selectYNequip() : void
      {
         var _loc4_:Goods = null;
         var _loc1_:Array = GameInstance.lookPlayerData.goodsInfo.goodsBagArr;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc4_ = _loc1_[_loc3_] as Goods;
            if(ItemPositionRange.POSITION_SHIBALUOHAN_ARR.indexOf(_loc4_.res.position) != -1)
            {
               _loc2_.push(_loc4_);
            }
            _loc3_++;
         }
         GameInstance.lookPlayerData.goodsInfo.YNsbtrArr = _loc2_;
         this.targetArrtibutePlane.showYNequipselect();
      }
   }
}

