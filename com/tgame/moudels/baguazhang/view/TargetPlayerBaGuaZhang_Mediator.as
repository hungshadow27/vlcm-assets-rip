package com.tgame.moudels.baguazhang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.baguazhang.BaGuaZhangRESManager;
   import com.tgame.common.res.baguazhang.BaGuaZhangRes;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.baguazhang.model.BaGuaZhang_MsgSendProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TargetPlayerBaGuaZhang_Mediator extends Mediator
   {
      
      public static const NAME:String = "TargetPlayerBaGuaZhang_Mediator";
      
      private var _msgSenderProxy:BaGuaZhang_MsgSendProxy;
      
      public function TargetPlayerBaGuaZhang_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function received_BaGuaZhangInfo(param1:int, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc6_:BaGuaZhangRes = null;
         var _loc11_:BaGuaZhangRes = null;
         var _loc12_:Goods = null;
         var _loc13_:String = null;
         var _loc14_:BaGuaZhangRes = null;
         var _loc15_:GoodsRes = null;
         if(!Fun.isVisible(GameInstance.uiInstance._targetAttribute))
         {
            return;
         }
         GameInstance.uiInstance.targetAttribute.set_BGHL(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         if(param2 != null)
         {
            GameInstance.uiInstance.targetAttribute.setJinduB(param1);
            GameInstance.uiInstance.targetAttribute.setJihuoB(param3);
            _loc11_ = BaGuaZhangRESManager.getLiantiRes(param1);
            if(_loc11_ != null)
            {
               if(_loc11_.f_tupo_need_goodsmodel > 0)
               {
                  _loc12_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc11_.f_tupo_need_goodsmodel,true);
               }
            }
         }
         var _loc4_:BaGuaZhangRes = BaGuaZhangRESManager.getLiantiRes(param1);
         var _loc5_:GoodsRes = GoodsResManager.getGoodsRes(_loc4_.f_tupo_need_goodsmodel);
         if(param1 != BaGuaZhangRESManager.MAX_LIANTI_LV)
         {
            _loc6_ = BaGuaZhangRESManager.getLiantiRes(param1 + 1);
         }
         var _loc7_:Array = [];
         var _loc8_:int = 1;
         while(_loc8_ <= BaGuaZhangRESManager.MAX_LIANTI_LV)
         {
            _loc13_ = "";
            _loc11_ = BaGuaZhangRESManager.getLiantiRes(_loc8_);
            _loc13_ += "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + BaGuaZhangRESManager.nameArr[_loc8_ - 1] + "：</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + _loc11_.f_name + "</font><br>";
            if(_loc8_ < param1)
            {
               _loc13_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功状态：已达成") + "</font>";
            }
            else if(_loc8_ == param1)
            {
               _loc13_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功状态：修炼中") + "</font>";
            }
            else
            {
               _loc13_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功状态：尚未到达") + "</font>";
            }
            _loc13_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"境界描述",[StaticValue.GREEN_HTML,_loc11_.f_desc]) + "</font>";
            if(_loc8_ != BaGuaZhangRESManager.MAX_LIANTI_LV)
            {
               _loc14_ = BaGuaZhangRESManager.getLiantiRes(_loc8_ + 1);
               _loc15_ = GoodsResManager.getGoodsRes(_loc11_.f_tupo_need_goodsmodel);
               _loc13_ += "<br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("境界提升：全部属性加成到顶后可以通过使用") + _loc15_.name + LanResManager.getLanCommonTextWords("将八卦掌境界提升到") + _loc14_.f_name + LanResManager.getLanCommonTextWords("境界") + "</font>";
            }
            _loc7_.push(_loc13_);
            _loc8_++;
         }
         GameInstance.uiInstance.targetAttribute.setJingjieB(_loc4_.f_desc2,GoodsResManager.getGoodsRes(_loc4_.f_food_goodsid).name);
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         if(param2 != null)
         {
            _loc9_ = param2[0] == _loc4_.f_hp && param2[1] == _loc4_.f_mp && param2[2] == _loc4_.f_sp && param2[3] == _loc4_.f_atk && param2[4] == _loc4_.f_def && param2[5] == _loc4_.f_move_speed && param2[6] == _loc4_.f_atk_speed && param2[7] == _loc4_.f_fjsh && param2[8] == _loc4_.f_shjm && param2[9] == _loc4_.f_aq_jv;
            _loc10_ = (_loc9_) && param1 != BaGuaZhangRESManager.MAX_LIANTI_LV;
            GameInstance.uiInstance.targetAttribute.setBar1B(_loc4_.f_hp > 0,param2[0],_loc4_.f_hp);
            GameInstance.uiInstance.targetAttribute.setBar2B(_loc4_.f_mp > 0,param2[1],_loc4_.f_mp);
            GameInstance.uiInstance.targetAttribute.setBar3B(_loc4_.f_sp > 0,param2[2],_loc4_.f_sp);
            GameInstance.uiInstance.targetAttribute.setBar4B(_loc4_.f_atk > 0,param2[3],_loc4_.f_atk);
            GameInstance.uiInstance.targetAttribute.setBar5B(_loc4_.f_def > 0,param2[4],_loc4_.f_def);
            GameInstance.uiInstance.targetAttribute.setBar6B(_loc4_.f_atk_speed > 0,param2[6],_loc4_.f_atk_speed);
            GameInstance.uiInstance.targetAttribute.setBar7B(_loc4_.f_move_speed > 0,param2[5],_loc4_.f_move_speed);
            GameInstance.uiInstance.targetAttribute.setBar10B(_loc4_.f_fjsh > 0,param2[7],_loc4_.f_fjsh);
            GameInstance.uiInstance.targetAttribute.setBar8B(_loc4_.f_shjm > 0,param2[8],_loc4_.f_shjm);
            GameInstance.uiInstance.targetAttribute.setBar9B(_loc4_.f_aq_jv > 0,param2[9],_loc4_.f_aq_jv);
         }
         else
         {
            _loc9_ = param1 < param1;
            _loc10_ = false;
            GameInstance.uiInstance.targetAttribute.setBar1B(_loc4_.f_hp > 0,_loc9_ ? _loc4_.f_hp : 0,_loc4_.f_hp);
            GameInstance.uiInstance.targetAttribute.setBar2B(_loc4_.f_mp > 0,_loc9_ ? _loc4_.f_mp : 0,_loc4_.f_mp);
            GameInstance.uiInstance.targetAttribute.setBar3B(_loc4_.f_sp > 0,_loc9_ ? _loc4_.f_sp : 0,_loc4_.f_sp);
            GameInstance.uiInstance.targetAttribute.setBar4B(_loc4_.f_atk > 0,_loc9_ ? _loc4_.f_atk : 0,_loc4_.f_atk);
            GameInstance.uiInstance.targetAttribute.setBar5B(_loc4_.f_def > 0,_loc9_ ? _loc4_.f_def : 0,_loc4_.f_def);
            GameInstance.uiInstance.targetAttribute.setBar6B(_loc4_.f_atk_speed > 0,_loc9_ ? _loc4_.f_atk_speed : 0,_loc4_.f_atk_speed);
            GameInstance.uiInstance.targetAttribute.setBar7B(_loc4_.f_move_speed > 0,_loc9_ ? _loc4_.f_move_speed : 0,_loc4_.f_move_speed);
            GameInstance.uiInstance.targetAttribute.setBar10B(_loc4_.f_fjsh > 0,_loc9_ ? _loc4_.f_fjsh : 0,_loc4_.f_fjsh);
            GameInstance.uiInstance.targetAttribute.setBar8B(_loc4_.f_shjm > 0,_loc9_ ? _loc4_.f_shjm : 0,_loc4_.f_shjm);
            GameInstance.uiInstance.targetAttribute.setBar9B(_loc4_.f_aq_jv > 0,_loc9_ ? _loc4_.f_aq_jv : 0,_loc4_.f_aq_jv);
         }
         GameInstance.uiInstance.targetAttribute.setMiaoshuB(BaGuaZhangRESManager.getLiantiMainDes(param1));
         if(param1 != BaGuaZhangRESManager.MAX_LIANTI_LV)
         {
            _loc13_ = "";
            _loc13_ = _loc13_ + LanResManager.getLanTextWords(this,"提升肉身境界以便能够获得更多的属性加成",[_loc5_.name,_loc6_.f_name]);
            if(_loc6_.f_hp > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("生命") + " +" + _loc6_.f_hp;
            }
            if(_loc6_.f_mp > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("内力") + " +" + _loc6_.f_mp;
            }
            if(_loc6_.f_sp > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("体力") + " +" + _loc6_.f_sp;
            }
            if(_loc6_.f_atk > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("攻击") + " +" + _loc6_.f_atk;
            }
            if(_loc6_.f_def > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("防御") + " +" + _loc6_.f_def;
            }
            if(_loc6_.f_atk_speed > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("暴击") + " +" + _loc6_.f_atk_speed;
            }
            if(_loc6_.f_move_speed > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("闪避") + " +" + _loc6_.f_move_speed;
            }
            if(_loc6_.f_fjsh > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("抵抗暗器") + " +" + _loc6_.f_fjsh;
            }
            if(_loc6_.f_shjm > 0)
            {
               _loc13_ += "\n" + LanResManager.getLanCommonTextWords("抵抗弓箭") + " +" + _loc6_.f_shjm;
            }
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            GameInstance.uiInstance.targetAttribute.addEventListener(TargetAttribute.GETDUANZAOROUSHENB,requestBaGuaZhang);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            GameInstance.uiInstance.targetAttribute.removeEventListener(TargetAttribute.GETDUANZAOROUSHENB,requestBaGuaZhang);
         });
      }
      
      private function requestBaGuaZhang(param1:Event) : void
      {
         GameInstance.uiInstance.targetAttribute.showSmithingBodyB();
         GameInstance.uiInstance.targetAttribute.setBaguazhangEnabledFunB();
         this.msgSenderProxy.send_53901(GameInstance.lookPlayerID);
      }
      
      private function get msgSenderProxy() : BaGuaZhang_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(BaGuaZhang_MsgSendProxy.NAME) as BaGuaZhang_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      public function updateSXFB(param1:Boolean, param2:int, param3:int = 500) : void
      {
         GameInstance.uiInstance.targetAttribute.setBar(param1,param2,param3);
      }
      
      public function initializeMainUI(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Boolean = false;
         if(param1 >= 8)
         {
            _loc6_ = true;
         }
         else
         {
            _loc6_ = false;
         }
         GameInstance.uiInstance.targetAttribute.setBaguazhangJinduNum(param2,_loc6_);
         var _loc7_:String = "";
         if(param2 > 0)
         {
            _loc7_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + " " + LanResManager.getLanCommonTextWords("防御:") + param4 + " " + LanResManager.getLanCommonTextWords("生命:") + param5 + "</font>";
         }
         else
         {
            _loc7_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("八卦掌顶级激活属性（未激活）") + "</font>";
         }
         GameInstance.uiInstance.targetAttribute.menuBaguazhangJinduToolTip(_loc7_);
      }
      
      public function setXueshou(param1:Boolean) : void
      {
         GameInstance.uiInstance.targetAttribute.setXueshou(param1);
      }
      
      public function setBaGuaDanTian(param1:Boolean, param2:Boolean) : void
      {
         GameInstance.uiInstance.targetAttribute.setBaGuaDanTian(param1,param2);
      }
   }
}

