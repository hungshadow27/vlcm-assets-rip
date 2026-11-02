package com.tgame.moudels.fight.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.fight.Fight_ApplicationFacade;
   import com.tgame.moudels.fight.model.Fight_BuffProxy;
   import com.tgame.moudels.fight.model.Fight_proxy;
   import com.zcp.engine.vo.map.MapTile;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Fight_PipeMediator extends Mediator
   {
      
      public static const NAME:String = "Fight_PipeMediator";
      
      private var _buffProxy:Fight_BuffProxy;
      
      private var _fightProxy:Fight_proxy;
      
      public function Fight_PipeMediator()
      {
         super(NAME);
      }
      
      private function get buffProxy() : Fight_BuffProxy
      {
         if(this._buffProxy == null)
         {
            this._buffProxy = facade.retrieveProxy(Fight_BuffProxy.NAME) as Fight_BuffProxy;
         }
         return this._buffProxy;
      }
      
      private function get fightProxy() : Fight_proxy
      {
         if(this._fightProxy == null)
         {
            this._fightProxy = facade.retrieveProxy(Fight_proxy.NAME) as Fight_proxy;
         }
         return this._fightProxy;
      }
      
      override public function onRegister() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Fight_ApplicationFacade.USE_SKILL,Fight_ApplicationFacade.MAIN_CHAR_ATTR_TIP,Fight_ApplicationFacade.MAIN_CHAR_SINGLE_ATTR_TIP,Fight_ApplicationFacade.FLOOR_ATTACK,Fight_ApplicationFacade.USE_SKILL_BIYISHUANGFEI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Skill = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Fight_ApplicationFacade.USE_SKILL:
               this.fightProxy.useSkill(_loc2_ as Skill);
               break;
            case Fight_ApplicationFacade.MAIN_CHAR_ATTR_TIP:
               this.fightProxy.attrTip(_loc2_);
               break;
            case Fight_ApplicationFacade.MAIN_CHAR_SINGLE_ATTR_TIP:
               this.fightProxy.attrSingleTip(_loc2_[0],_loc2_[1]);
               break;
            case Fight_ApplicationFacade.FLOOR_ATTACK:
               this.fightProxy.attackByPointOK(_loc2_ as MapTile);
               break;
            case Fight_ApplicationFacade.USE_SKILL_BIYISHUANGFEI:
               if(GameInstance.mainCharData.attributeInfo.spouseID == 0)
               {
                  return;
               }
               _loc3_ = OtherConst.getBiYiShuangFeiSkill();
               if(_loc3_)
               {
                  this.fightProxy.useSkill(_loc3_);
               }
         }
      }
   }
}

