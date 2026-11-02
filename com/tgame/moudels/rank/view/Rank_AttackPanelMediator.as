package com.tgame.moudels.rank.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.mount.MountRes;
   import com.tgame.common.res.mount.MountResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.rankAttack.RankAttackVO;
   import com.tgame.manager.AvatarManager;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.rank.model.Rank_MsgSendProxy;
   import com.tgame.shell.view.components.ZhandouliPanel;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Rank_AttackPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Rank_AttackPanelMediator";
      
      public var selectUserID:int;
      
      private var char_avatar_zizeng:int = 0;
      
      private var _msgSenderProxy:Rank_MsgSendProxy;
      
      public function Rank_AttackPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : ZhandouliPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.rankAttackPanel);
         }
         return viewComponent as ZhandouliPanel;
      }
      
      public function setSelectUserID(param1:int) : void
      {
         this.selectUserID = param1;
      }
      
      public function setLookAttackPlayer(param1:int, param2:RankAttackVO, param3:int) : void
      {
         if(param1 != this.selectUserID)
         {
            param2 = null;
            return;
         }
         this.msgSenderProxy.send_50337({
            "index":102,
            "id":param1
         });
         if(!Fun.isVisible(GameInstance.uiInstance._rankAttackPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_RANK_ATTACK_PANEL);
         }
         this.panel.setValue(param2,param3);
      }
      
      public function setRankAttackPlayerAdv(param1:Object) : void
      {
         var _loc6_:Array = null;
         var _loc7_:Goods = null;
         if(!Fun.isVisible(GameInstance.uiInstance._rankAttackPanel))
         {
            return;
         }
         var _loc2_:Boolean = param1 == null ? false : true;
         var _loc3_:int = 0;
         if(!_loc2_)
         {
            this.setCharAvatar(null);
            this.panel.setICOXiantian(false,0,0,-1);
            this.panel.setICORouti(false);
            this.panel.setICOHuXinYao(false);
            this.panel.setICONiXi(false);
            this.panel.setICOWuhun(0,false,false,0,false,0,false,false,0);
            return;
         }
         var _loc4_:Array = ExchangePositionManager.getEquipStatus(param1.equipArr);
         if(_loc4_.length > 0)
         {
            this.panel.setStarState(_loc4_[0][0],_loc4_[0][1],_loc4_[1][0],_loc4_[1][1],_loc4_[2][0],_loc4_[2][1],_loc4_[3][0],_loc4_[3][1],_loc4_[4][0],_loc4_[4][1],_loc4_[5][0],_loc4_[5][1],_loc4_[6][0],_loc4_[6][1],_loc4_[7][0],_loc4_[7][1]);
         }
         else
         {
            this.panel.setStarState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         }
         if(param1.taoZhuang)
         {
            this.panel.setSiShengShouState(12,12,12,12);
         }
         else
         {
            _loc6_ = ExchangePositionManager.getSiShengShouStatus(param1.equipArr);
            if(_loc6_.length > 0)
            {
               this.panel.setSiShengShouState(_loc6_[0],_loc6_[1],_loc6_[2],_loc6_[3]);
            }
            else
            {
               this.panel.setSiShengShouState(0,0,0,0);
            }
         }
         if(param1.yupeiID)
         {
            _loc7_ = new Goods(param1.yupeiID);
            _loc7_.position = _loc7_.res.position;
            _loc7_.roleID = param1.id;
         }
         this.panel.setICOXiantian(param1.isXTWJ,param1.TSNL,param1.ShenNongBaiChaoDanSta,param1.qianNengXinFaSta);
         this.panel.setICORouti(param1.isRTJS);
         this.panel.setICOWuhun(param1.wuhun,param1.wuHunShengJiDan,param1.huohundan,param1.wuhunshendan,param1.longhunwupo,param1.longhunshendan,param1.shenfumiji,param1.isNeitishenqi,param1.neitishenqi);
         this.panel.setICOHuXinYao(param1.HuXinYao);
         this.panel.setICONiXi(param1.niXiStatus);
         this.panel.setICOFengHuang(param1.fengHuang);
         var _loc5_:PurePlayer = new PurePlayer();
         _loc5_.isOnMount = param1.isOnMount;
         _loc5_.id = param1.id;
         _loc5_.avatarInfo.useIng_Weapon_id = param1.useIng_Weapon_id;
         _loc5_.avatarInfo.isFeixing = param1.isFeixing;
         _loc5_.avatarInfo.isFeixing_huanzhuang_Id = param1.isFeixing_huanzhuang_Id;
         _loc5_.avatarInfo.isFeixing_wuhun_Id = param1.isFeixing_wuhun_Id;
         param1.mountID = param1.mountID ? param1.mountID : -1;
         _loc5_ = this.setPurePlayer(param1.mountID,param1.partyID,_loc5_,param1.equipArr,param1.usingFashion,param1.useAvatarType);
         this.setCharAvatar(_loc5_);
      }
      
      private function get msgSenderProxy() : Rank_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Rank_MsgSendProxy.NAME) as Rank_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function setCharAvatar(param1:PurePlayer) : void
      {
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pPlayer.id + "_" + char_avatar_zizeng)
            {
               return;
            }
            panel.avatar(param2);
            if($pPlayer.avatarInfo.needChangeAvatarXY)
            {
               panel.setAvaterXY(true);
            }
         };
         this.panel.avatar(null);
         if(!$pPlayer)
         {
            return;
         }
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.char_avatar_zizeng,callBack,apdArr);
      }
      
      private function setPurePlayer(param1:int, param2:int, param3:PurePlayer, param4:Array, param5:int = 0, param6:int = 0) : PurePlayer
      {
         var _loc10_:MountRes = null;
         var _loc11_:int = 0;
         var _loc12_:GoodsRes = null;
         var _loc7_:AttributeInfo = param3.attributeInfo;
         var _loc8_:AvatarInfo = param3.avatarInfo;
         _loc7_.partyID = param2;
         _loc8_.usingFashion = param5;
         _loc8_.useAvatarType = param6;
         if(param1 > 0)
         {
            if(_loc8_.usingFashion == 1)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,SpecialGoodsID.HUANGJIN_SHENGLONG_ID),AvatarPartType.MOUNT);
            }
            else if(_loc8_.useAvatarType > 0)
            {
               _loc8_.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,AvatarManager.getAvatarIdByType(param6)),AvatarPartType.MOUNT);
            }
            else
            {
               _loc10_ = MountResManager.getMountRes(param1);
               if(_loc10_ != null)
               {
                  param3.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,_loc10_.id_m),AvatarPartType.MOUNT);
               }
            }
            _loc8_.lastMountId = param1;
         }
         var _loc9_:int = 0;
         while(_loc9_ < param4.length)
         {
            _loc11_ = (param4[_loc9_] as Goods).id;
            _loc12_ = GoodsResManager.getGoodsRes(_loc11_);
            if(_loc12_ != null)
            {
               AvatarManager.dressAvatarData(_loc8_,_loc12_.position,_loc12_.id_m,_loc7_.getSex());
            }
            _loc9_++;
         }
         return param3;
      }
   }
}

