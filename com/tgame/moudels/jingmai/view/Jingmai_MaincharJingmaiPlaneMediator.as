package com.tgame.moudels.jingmai.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.jingmai.XueweiRes;
   import com.tgame.common.res.jingmai.XueweiResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.qihai.QihaiManager;
   import com.tgame.common.res.qihai.QihaiRes;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.JingmaiInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jingmai.Jingmai_ApplicationFacade;
   import com.tgame.moudels.jingmai.model.Jingmai_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Jingmai_MaincharJingmaiPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Jingmai_MaincharJingmaiPlaneMediator";
      
      public var xuewei_id:int = 0;
      
      private var _jingmaitongren_num:int = 0;
      
      private var _sucess_probability:Number = 0;
      
      private var qihaiID:int = 0;
      
      private var _zhongshangJingmaiArr:Array = [];
      
      private var _msgSenderProxy:Jingmai_MsgSenderProxy;
      
      public function Jingmai_MaincharJingmaiPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      private function get msgSenderProxy() : Jingmai_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Jingmai_MsgSenderProxy.NAME) as Jingmai_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Jingmai_ApplicationFacade.SWAP_JINGMAI_ZONGLAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Jingmai_ApplicationFacade.SWAP_JINGMAI_ZONGLAN:
               this.setZonglan(true);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETVENATION,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_VENATION_EVENT_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QI_HAI_BTN_CLICKED,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QI_HAI_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_VENATION_POINT_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_VENATION_USE_ITEM_COUNT,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_VENATION_POINT_IMPACT_STARTBTN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_VENATION_BREAKTHROUGH,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_VENATION_BREAKTHROUGH_OK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_VENATION_GET_POINT_ATTRIBUTE,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETVENATION,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_VENATION_EVENT_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QI_HAI_BTN_CLICKED,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QI_HAI_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_VENATION_POINT_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_VENATION_USE_ITEM_COUNT,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_VENATION_POINT_IMPACT_STARTBTN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_VENATION_BREAKTHROUGH,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_VENATION_BREAKTHROUGH_OK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_VENATION_GET_POINT_ATTRIBUTE,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case CharAttribute.GETVENATION:
               this.mainCharArrtibutePlane.setLongmaiJingyuan(GameInstance.mainCharData.attributeInfo.lmStatus);
               this.mainCharArrtibutePlane.setZhuanshiZhenlong(GameInstance.mainCharData.attributeInfo.zszlStatus);
               this.setZonglan();
               this.showZhongshang();
               this.msgSenderProxy.send_50217();
               break;
            case CharAttribute.UI_VENATION_EVENT_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = parseInt(String(_loc3_.data));
               this.setJingmai(_loc4_);
               if(GameInstance.mainCharData.jingmaiInfo.isZhenlong)
               {
                  this.mainCharArrtibutePlane.setBtnType(false);
                  this.msgSenderProxy.send_50233(_loc4_);
                  this.mainCharArrtibutePlane.closeQiHaiPanel();
               }
               break;
            case CharAttribute.UI_QI_HAI_BTN_CLICKED:
               _loc3_ = param1 as BaseEvent;
               _loc5_ = parseInt(String(_loc3_.data));
               this.msgSenderProxy.send_50231(_loc5_);
               break;
            case CharAttribute.UI_QI_HAI_SHOW:
               this.setQihaiData(this.qihaiID);
               this.mainCharArrtibutePlane.showQueRenPanel();
               break;
            case CharAttribute.UI_VENATION_POINT_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc6_ = String(_loc3_.data);
               this.showOpenXuewei(_loc6_);
               break;
            case CharAttribute.UI_VENATION_USE_ITEM_COUNT:
               _loc3_ = param1 as BaseEvent;
               _loc7_ = parseInt(String(_loc3_.data));
               this.setSucessProbability(_loc7_);
               break;
            case CharAttribute.UI_VENATION_POINT_IMPACT_STARTBTN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc8_ = String(_loc3_.data);
               if(_loc8_ == "yes")
               {
                  if(GameInstance.mainCharData.jingmaiInfo.isZhenlong)
                  {
                     this._jingmaitongren_num = 0;
                  }
                  this.msgSenderProxy.send_50203([this.xuewei_id,this._jingmaitongren_num]);
                  this._jingmaitongren_num = 0;
               }
               break;
            case CharAttribute.UI_VENATION_BREAKTHROUGH:
               this.msgSenderProxy.send_50211();
               break;
            case CharAttribute.UI_VENATION_BREAKTHROUGH_OK:
               this.msgSenderProxy.send_50209();
               break;
            case CharAttribute.UI_VENATION_GET_POINT_ATTRIBUTE:
               _loc3_ = param1 as BaseEvent;
               _loc6_ = String(_loc3_.data);
               this.setXueweiShuxingXinxi(_loc6_);
         }
      }
      
      public function setZonglan(param1:Boolean = false) : void
      {
         var _loc2_:Player = GameInstance.mainChar.data as Player;
         var _loc3_:JingmaiInfo = _loc2_.jingmaiInfo;
         this.mainCharArrtibutePlane.showVenation(_loc3_.getOpenedJingmaiIDArr(),_loc3_.getOpenedXueweiNum(),OtherConst.MAX_XUEWEI * (_loc3_.isZhenlong ? 2 : 1),param1,_loc3_.isZhenlong);
         this.msgSenderProxy.send_50213();
      }
      
      public function setJingmai(param1:int) : void
      {
         var _loc9_:int = 0;
         var _loc2_:JingmaiInfo = GameInstance.mainCharData.jingmaiInfo;
         var _loc3_:int = _loc2_.getOpenedXueweiIDByJingmaiID(param1);
         var _loc4_:Boolean = _loc2_.isJingmaiOpened(param1);
         var _loc5_:XueweiRes = XueweiResManager.getJingmaiRes(param1,GameInstance.mainCharData.jingmaiInfo.isZhenlong);
         if(!_loc5_)
         {
            return;
         }
         var _loc6_:Array = [];
         if(_loc5_.f_hp_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"血") + _loc5_.f_hp_add);
         }
         if(_loc5_.f_mp_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"蓝") + _loc5_.f_mp_add);
         }
         if(_loc5_.f_sp_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"体") + _loc5_.f_sp_add);
         }
         if(_loc5_.f_attack_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"攻") + _loc5_.f_attack_add);
         }
         if(_loc5_.f_defence_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"防") + _loc5_.f_defence_add);
         }
         if(_loc5_.f_dodge_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"闪") + _loc5_.f_dodge_add);
         }
         if(_loc5_.f_crt_add > 0)
         {
            _loc6_.push(LanResManager.getLanTextWords(this,"暴") + _loc5_.f_crt_add);
         }
         var _loc7_:String = _loc6_.join(",");
         var _loc8_:Function = this.mainCharArrtibutePlane["show_" + param1];
         if(_loc8_ != null)
         {
            if(_loc3_ == -1)
            {
               _loc9_ = 0;
            }
            else
            {
               _loc9_ = _loc3_ % 100 - 1;
            }
            if(_loc4_)
            {
               _loc9_ = -1;
            }
            _loc8_(_loc9_,_loc4_,_loc7_);
         }
      }
      
      public function showOpenXuewei(param1:String) : void
      {
         var _loc4_:Goods = null;
         var _loc5_:Goods = null;
         var _loc2_:XueweiRes = XueweiResManager.getXueweiResByName(param1,GameInstance.mainCharData.jingmaiInfo.isZhenlong);
         if(!_loc2_)
         {
            return;
         }
         this.xuewei_id = _loc2_.f_id;
         var _loc3_:String = _loc2_.addStr;
         this._sucess_probability = _loc2_.f_odds / 10000 * 100;
         if(GameInstance.mainCharData.jingmaiInfo.isZhenlong)
         {
            if(_loc2_.f_goodmodel_id > 0)
            {
               _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc2_.f_goodmodel_id,true,true);
               _loc4_.count = Math.min(_loc4_.count,_loc2_.f_goodmodel_count);
            }
            this.mainCharArrtibutePlane.showZhenLongImpactPanel(_loc2_.f_name,_loc3_,GameInstance.mainCharData.attributeInfo.gqNow,_loc4_,_loc2_.f_need_zhenqi,this._sucess_probability,_loc2_.f_goodmodel_count);
         }
         else
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JINGMAITONGREN_ID,true);
            this.mainCharArrtibutePlane.showImpactPointPanel(_loc2_.f_name,_loc3_,GameInstance.mainCharData.attributeInfo.gqNow,_loc5_,_loc2_.f_need_zhenqi,this._sucess_probability);
         }
      }
      
      public function setSucessProbability(param1:int) : void
      {
         this._jingmaitongren_num = param1;
         var _loc2_:Number = this._sucess_probability + param1 * 5;
         this.mainCharArrtibutePlane.setImpactPointProbability(_loc2_);
      }
      
      public function setXueweiShuxingXinxi(param1:String) : void
      {
         var _loc2_:XueweiRes = XueweiResManager.getXueweiResByName(param1,GameInstance.mainCharData.jingmaiInfo.isZhenlong);
         if(_loc2_ == null)
         {
            return;
         }
         this.mainCharArrtibutePlane.setVenationPointAttribute(param1,_loc2_.addStr,_loc2_.f_need_zhenqi);
      }
      
      public function f5JingmaiByXeiweiID(param1:int) : void
      {
         if(this.xuewei_id != param1)
         {
            return;
         }
         this.f5Jingmai(Math.floor(this.xuewei_id / 100));
         if(GameInstance.mainCharData.jingmaiInfo.isZhenlong)
         {
            this.msgSenderProxy.send_50233(Math.floor(this.xuewei_id / 100));
         }
      }
      
      public function f5Jingmai(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
         }
         this.setZonglan(true);
         this.setJingmai(param1);
      }
      
      public function received_zhongshang(param1:Array) : void
      {
         var _loc3_:Array = null;
         this._zhongshangJingmaiArr.length = 0;
         var _loc2_:int = getTimer() / 1000;
         for each(_loc3_ in param1)
         {
            this._zhongshangJingmaiArr[this._zhongshangJingmaiArr.length] = [_loc3_[0],_loc3_[1],_loc2_];
         }
         this.showZhongshang();
      }
      
      private function showZhongshang() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         var _loc4_:XueweiRes = null;
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute) && GameInstance.uiInstance._charAttribute.tabBar.currentLabel == LanResManager.getLanCommonTextWords("角色"))
         {
            _loc1_ = getTimer() / 1000;
            _loc2_ = [];
            for each(_loc3_ in this._zhongshangJingmaiArr)
            {
               _loc4_ = XueweiResManager.getJingmaiRes(_loc3_[0],GameInstance.mainCharData.jingmaiInfo.isZhenlong);
               if(_loc4_ != null)
               {
                  _loc2_[_loc2_.length] = [_loc4_.f_name,Math.max(0,_loc3_[1] - (_loc1_ - _loc3_[2]))];
               }
            }
            GameInstance.uiInstance.charAttribute.setJingMaiZhongShang(_loc2_);
         }
      }
      
      public function shouQihai(param1:int, param2:Boolean, param3:int, param4:int) : void
      {
         this.qihaiID = param1;
         this.setQihaiData(this.qihaiID);
         this.mainCharArrtibutePlane.setBtnType(true,param2);
         this.mainCharArrtibutePlane.setZhuFu(param3,param4);
      }
      
      public function setQihaiData(param1:int) : void
      {
         var _loc2_:QihaiRes = QihaiManager.getQihaiRes(param1);
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_.id);
         if(GameInstance.mainCharData.moneyInfo.copper >= int(_loc2_.up_copper))
         {
            _loc3_.push(true);
         }
         else
         {
            _loc3_.push(false);
         }
         _loc3_.push(_loc2_.up_copper);
         if(GameInstance.mainCharData.attributeInfo.gqNow >= int(_loc2_.up_zhenqi))
         {
            _loc3_.push(true);
         }
         else
         {
            _loc3_.push(false);
         }
         _loc3_.push(_loc2_.up_zhenqi);
         _loc3_.push(_loc2_.up_probability_show);
         var _loc4_:String = QihaiManager.getQihaiJiachengRes(param1);
         _loc3_.push(_loc4_);
         this.mainCharArrtibutePlane.setQiHaiData(_loc3_);
      }
      
      public function qihaiIsChenggong(param1:int, param2:int, param3:int) : void
      {
         if(param1)
         {
            this.mainCharArrtibutePlane.closeQiHaiPanel();
            this.mainCharArrtibutePlane.setBtnType(true,true);
         }
         else
         {
            this.mainCharArrtibutePlane.setZhuFu(param2,param3);
         }
      }
   }
}

