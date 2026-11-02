package com.tgame.moudels.dongxiao.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dongxiao.model.Dongxiao_MsgSenderProxy;
   import com.tgame.moudels.dongxiao.model.vo.DongXiaoInfo;
   import com.tgame.shell.view.components.TargetAttribute;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Dongxiao_TargetCharDongxiaoPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "DongxiaoTargetCharDongxiaoPlaneMediator";
      
      private var _msgSenderProxy:Dongxiao_MsgSenderProxy;
      
      public function Dongxiao_TargetCharDongxiaoPlaneMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Dongxiao_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Dongxiao_MsgSenderProxy.NAME) as Dongxiao_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            GameInstance.uiInstance.targetAttribute.addEventListener(TargetAttribute.DONGXIAO,requestDongxiao);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            GameInstance.uiInstance.targetAttribute.removeEventListener(TargetAttribute.DONGXIAO,requestDongxiao);
         });
      }
      
      private function requestDongxiao(param1:Event) : void
      {
         GameInstance.uiInstance.targetAttribute.showDongxiao();
         this.msgSenderProxy.send_53801([GameInstance.lookPlayerID,0]);
      }
      
      public function received_dongxiaoInfo(param1:DongXiaoInfo) : void
      {
         GameInstance.uiInstance.targetAttribute.setDongxiaoDengji(param1.duan + LanResManager.getLanCommonTextWords("段") + "(" + DongXiaoInfo.getShowLv(param1.lv) + "/" + 4 + ")");
         GameInstance.uiInstance.targetAttribute.setDongxiaoJindu(param1.nowXiulian,param1.maxXiulian,false);
         GameInstance.uiInstance.targetAttribute.setDongxiaoJianshu(param1.skillArr);
         GameInstance.uiInstance.targetAttribute.setDongxiaoShuxing(param1.name,param1.duan,DongXiaoInfo.getShowLv(param1.lv),[param1.add_ap,param1.add_dp,param1.add_hp,param1.add_mp,param1.add_pp]);
         GameInstance.uiInstance.targetAttribute.setDongxiaoMiaoshu(param1.des);
         GameInstance.uiInstance.targetAttribute.setUse(param1.isOpen);
         GameInstance.uiInstance.targetAttribute.setDongxiaoEnabledFun();
         GameInstance.uiInstance.targetAttribute.DongxiaoShow(param1.visible);
         GameInstance.uiInstance.targetAttribute.setYCSX(param1.isJihuo);
         GameInstance.uiInstance.targetAttribute.setZhanyin(param1.isZhanyin);
      }
      
      public function initializeMainUI(param1:DongXiaoInfo) : void
      {
         var _loc2_:Boolean = false;
         if(param1.duan >= 7 && DongXiaoInfo.getShowLv(param1.lv) >= 4)
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         GameInstance.uiInstance.targetAttribute.setDongxiaoJinduNum(param1.jihuoJindu,_loc2_);
         var _loc3_:String = "";
         if(param1.jihuoJindu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param1.addJihuoGongji + " " + LanResManager.getLanCommonTextWords("防御:") + param1.addJihuoFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + param1.addJihuoShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洞箫顶级激活属性（未激活）") + "</font>";
         }
         GameInstance.uiInstance.targetAttribute.menuDongxiaoToolTip(_loc3_);
      }
   }
}

