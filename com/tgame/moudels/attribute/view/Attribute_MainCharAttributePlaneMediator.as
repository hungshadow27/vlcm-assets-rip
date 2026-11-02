package com.tgame.moudels.attribute.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.attribute.Attribute_ApplicationFacade;
   import com.tgame.moudels.attribute.model.Attribute_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.attribute.AnqiActivationHuodong;
   import com.tgame.shell.view.components.attribute.OtherAttributeCanvas;
   import com.tgame.shell.view.components.huodong.JihuoRoutijinshenPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Attribute_MainCharAttributePlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Attribute_MainCharAttributePlaneMediator";
      
      private var avatar_zizeng:int = 0;
      
      public var _routijinshenPanel:JihuoRoutijinshenPanel;
      
      private var _jiuhoPanel:AnqiActivationHuodong;
      
      private var _senderProxy:Attribute_MsgSenderProxy;
      
      public function Attribute_MainCharAttributePlaneMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Attribute_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Attribute_MsgSenderProxy.NAME) as Attribute_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Attribute_ApplicationFacade.CHANGED_MAINCHAR_BASE_ATTR,Attribute_ApplicationFacade.UPDATE_MAINCHAR_AVATAR_IN_PLANE,Attribute_ApplicationFacade.KUAFU_STATUS,Attribute_ApplicationFacade.NPC_REQ_FUNCTION];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var noteBody:Object = null;
         var bo:Boolean = false;
         var tag:Boolean = false;
         var type:int = 0;
         var g:Goods = null;
         var planeVisible:Boolean = false;
         var goods:Goods = null;
         var note:INotification = param1;
         noteBody = note.getBody();
         switch(note.getName())
         {
            case Attribute_ApplicationFacade.CHANGED_MAINCHAR_BASE_ATTR:
               bo = Boolean(note.getBody());
               this.update(true,true,bo);
               break;
            case Attribute_ApplicationFacade.UPDATE_MAINCHAR_AVATAR_IN_PLANE:
               if(GameInstance.uiInstance._charAttribute != null)
               {
                  planeVisible = Fun.isVisible(this.mainCharArrtibutePlane);
                  if(planeVisible)
                  {
                     this.setAvatar();
                  }
               }
               break;
            case Attribute_ApplicationFacade.KUAFU_STATUS:
               tag = noteBody as Boolean;
               if(tag)
               {
                  this.mainCharArrtibutePlane.showMask(true);
               }
               else
               {
                  this.mainCharArrtibutePlane.showMask(false);
               }
               break;
            case Attribute_ApplicationFacade.NPC_REQ_FUNCTION:
               type = Number(noteBody);
               if(type == NpcFunctionType.JIHUO_DONGXIAO_YINGCANG)
               {
                  if(this._jiuhoPanel == null)
                  {
                     this._jiuhoPanel = new AnqiActivationHuodong();
                     this._jiuhoPanel.setDXInit();
                     this._jiuhoPanel.addEventListener(AnqiActivationHuodong.UI_DONGXIAOACTIVATIONHUODONG_YOUHUIKAIQI_CLICK,function(param1:Event):void
                     {
                        senderProxy.send_53811(1);
                     });
                  }
                  goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.DXJHS,true);
                  this._jiuhoPanel.setDXInitialize(goods,goods.count);
                  this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
                  this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
                  GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
               }
               if(type != NpcFunctionType.JIHUO_ROUTIJINSHEN)
               {
                  return;
               }
               if(this._routijinshenPanel == null)
               {
                  this._routijinshenPanel = new JihuoRoutijinshenPanel();
                  this._routijinshenPanel.addEventListener(JihuoRoutijinshenPanel.UI_MENGHUANSISHENGSHOU_JIHUO_CLICK,function(param1:Event):void
                  {
                     senderProxy.send_53011();
                     if(_routijinshenPanel.parent != null)
                     {
                        _routijinshenPanel.parent.removeChild(_routijinshenPanel);
                     }
                  });
                  this._routijinshenPanel.addEventListener(Event.REMOVED_FROM_STAGE,function(param1:Event):void
                  {
                     _routijinshenPanel = null;
                  });
               }
               g = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.BUXIU_JINDAN,true);
               this._routijinshenPanel.setInitialize(g,100);
               this._routijinshenPanel.x = GameInstance.stage.stageWidth / 2 - this._routijinshenPanel.panelWidth / 2;
               this._routijinshenPanel.y = GameInstance.stage.stageHeight / 2 - this._routijinshenPanel.panelHeight / 2;
               GameInstance.uiInstance.uiContainer.addChild(this._routijinshenPanel);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETCHARATTRIBUTE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(OtherAttributeCanvas.UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(OtherAttributeCanvas.UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHARATTRIBUTE_ARRRIBUT_POINT_OK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHAR_SELECT_SHOW_YUPEI,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETCHARATTRIBUTE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(OtherAttributeCanvas.UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(OtherAttributeCanvas.UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHARATTRIBUTE_ARRRIBUT_POINT_OK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHAR_SELECT_SHOW_YUPEI,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc5_:Array = null;
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:AttributeInfo = _loc2_.attributeInfo;
         var _loc4_:String = param1.type;
         switch(_loc4_)
         {
            case CharAttribute.GETCHARATTRIBUTE:
               this.mainCharArrtibutePlane.showChar();
               this.update(false);
               break;
            case CharAttribute.UI_CHARATTRIBUTE_ARRRIBUT_POINT_OK:
               _loc5_ = (param1 as BaseEvent).data as Array;
               _loc5_ = [_loc5_[0] - _loc3_.points_attack,_loc5_[1] - _loc3_.points_defence,_loc5_[2] - _loc3_.points_fly,_loc5_[3] - _loc3_.points_stong];
               this.senderProxy.send_50601([_loc5_[0],_loc5_[1],_loc5_[2],_loc5_[3]]);
               break;
            case OtherAttributeCanvas.UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,1);
               break;
            case OtherAttributeCanvas.UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,2);
               break;
            case CharAttribute.UI_CHAR_SELECT_SHOW_YUPEI:
               this.senderProxy.send_52351((param1 as BaseEvent).data as int);
         }
      }
      
      public function setLayout(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.setLayout(param1);
      }
      
      public function update(param1:Boolean = true, param2:Boolean = false, param3:Boolean = false) : void
      {
         if(GameInstance.uiInstance._charAttribute == null)
         {
            return;
         }
         var _loc4_:Player = GameInstance.mainCharData;
         var _loc5_:AttributeInfo = _loc4_.attributeInfo;
         var _loc6_:BanghuiInfo = _loc4_.banghuiInfo;
         var _loc7_:Boolean = Fun.isVisible(this.mainCharArrtibutePlane);
         if(!param1 || _loc7_)
         {
            if(!param2)
            {
               this.setAvatar();
               this.setPoint(_loc5_.points_attack,_loc5_.points_defence,_loc5_.points_fly,_loc5_.points_stong,_loc5_.points_action);
               this.setFlag(_loc6_.bangqiImgID);
            }
            if(param3)
            {
               this.setAvatar();
               this.setPoint(_loc5_.points_attack,_loc5_.points_defence,_loc5_.points_fly,_loc5_.points_stong,_loc5_.points_action);
               this.setFlag(_loc6_.bangqiImgID);
            }
            this.setBaseAttribute(GameInstance.mainChar.name,String(_loc5_.prestige_chengzhan),_loc5_.expNow,_loc5_.expMax,_loc5_.lv,_loc6_.banghuiName,_loc5_.getPartyName(),_loc5_.spouseName,_loc5_.prestige_lunjian,_loc5_.cjNow,_loc5_.prestige_fuqijingji,_loc5_.prestige_zhizungongxun,_loc5_.prestige_shenshengzhandouli);
            this.mainCharArrtibutePlane.set9JianJianCheng(_loc5_.dugu_baoji_jianmian,_loc5_.dugu_anqi_jianmian,_loc5_.dugu_anqi_dikang,_loc5_.dugu_gongjian_dikang,_loc5_.dugu_dantian_dikang,_loc5_.add2_bj,_loc5_.add2_aq,_loc5_.add2_daq,_loc5_.add2_dgj,_loc5_.add2_ddt);
            this.setZhenQi(_loc5_.gqNow,_loc5_.gqMax);
            this.setHPMP(_loc5_.hpNow,_loc5_.hpMax,_loc5_.mpNow,_loc5_.mpMax,_loc5_.ppNow,_loc5_.ppMax);
            this.setSkillValue(_loc5_.ap,_loc5_.dp,_loc5_.cp,_loc5_.ev,_loc5_.adx,_loc5_.mdx);
            this.mainCharArrtibutePlane.setICOXiantian(GameInstance.mainCharData.attributeInfo.isJiHuoXianTianWuJing == 1,GameInstance.mainCharData.attributeInfo.useTianShengNeiliCount,GameInstance.mainCharData.attributeInfo.shenNongBaiChaoDanSta,GameInstance.mainCharData.attributeInfo.qianNengXinFaSta);
            this.mainCharArrtibutePlane.setICOWuhun(GameInstance.mainCharData.attributeInfo.useWuhundanCount,GameInstance.mainCharData.attributeInfo.isWuHunShengJiDanJiHuo,GameInstance.mainCharData.attributeInfo.isHuoHunDanJiHuo,GameInstance.mainCharData.attributeInfo.wuHunShenDan,GameInstance.mainCharData.attributeInfo.isLongHunWuPoJiHuo,GameInstance.mainCharData.attributeInfo.longHunShenDan,GameInstance.mainCharData.attributeInfo.isShenFuMiJi,GameInstance.mainCharData.attributeInfo.isNeitishenqi,GameInstance.mainCharData.attributeInfo.neitishenqi);
            this.mainCharArrtibutePlane.setICOHuXinYao(GameInstance.mainCharData.attributeInfo.isHuXinYaoJiHuo);
            this.mainCharArrtibutePlane.setICONiXi(GameInstance.mainCharData.attributeInfo.niXiStatus);
            this.mainCharArrtibutePlane.setICOFengHuang(GameInstance.mainCharData.attributeInfo.fengHuang);
            this.mainCharArrtibutePlane.addSlot(GameInstance.mainCharData.attributeInfo.isXunzhangDakong);
            if(GameInstance.mainCharData.attributeInfo.taoZhuang)
            {
               this.mainCharArrtibutePlane.setSiShengShouState(12,12,12,12);
            }
            this.setStarSta(_loc5_.starSta);
            this.setStatusByString(GameInstance.mainCharData.attributeInfo.statusString);
            if(param3 || !param2)
            {
               this.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            }
            if(GameInstance.mainCharData.isDiZi)
            {
               this.mainCharArrtibutePlane.setDiZiData(_loc5_.zuShiParty,_loc5_.zuShiName,GameInstance.mainCharData.skillInfo.skillLevel);
            }
         }
      }
      
      private function setAvatar() : void
      {
         var play:Player;
         var sex:int;
         var apdArr:Array;
         var callBack:Function = null;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != GameInstance.mainChar.id + "_" + avatar_zizeng)
            {
               return;
            }
            mainCharArrtibutePlane.setAvatar(param2);
         };
         this.mainCharArrtibutePlane.setAvatar(null);
         play = GameInstance.mainChar.data as Player;
         sex = play.attributeInfo.getSex();
         apdArr = play.avatarInfo.getSimpleAPDList(GameInstance.mainChar.isOnMount,sex);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(GameInstance.mainChar.id + "_" + ++this.avatar_zizeng,callBack,apdArr);
      }
      
      public function setBaseAttribute(param1:String, param2:String, param3:Number, param4:Number, param5:int, param6:String, param7:String, param8:String, param9:int, param10:int, param11:int, param12:int, param13:int) : void
      {
         if(ReloginManager.isInKuafu_To_biWuDaHui != 0)
         {
            param10 = 0;
         }
         this.mainCharArrtibutePlane.setBaseAttribute(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setZhenQi(param1:int, param2:int) : void
      {
         this.mainCharArrtibutePlane.setZhenQi(param1,param2);
      }
      
      public function setShowItem(param1:Array) : void
      {
         var bodyArr:Array;
         var booArr:Array;
         var siShengShouArr:Array = null;
         var value:Array = param1;
         var wulizhiAr:Array = new Array();
         var zhanqiAr:Array = new Array();
         var CJTBSAr:Array = new Array();
         var TSJJAr:Array = new Array();
         var BGHLAr:Array = new Array();
         var XLSBZAr:Array = new Array();
         var YanYueZhenAr:Array = new Array();
         var TianMenZhenAr:Array = new Array();
         var HuTaoZhenAr:Array = new Array();
         var QinLongGongAr:Array = new Array();
         var AoJianShenJiangJiAr:Array = new Array();
         var MingJiaoZhangWuJiAr:Array = new Array();
         var JueZhanGuangMingDingAr:Array = new Array();
         var YunLongZhenAr:Array = new Array();
         var ChangSheZhenAr:Array = new Array();
         var YiJinJingAr:Array = new Array();
         var XuanTieJianFaAr:Array = new Array();
         var HeYiZhenAr:Array = new Array();
         var XuanXiangZhenAr:Array = new Array();
         var CanHeZhiAr:Array = new Array();
         var JiuQuHuangHeZhenAr:Array = new Array();
         var XianTianGongAr:Array = new Array();
         var ChangShengJueAr:Array = new Array();
         var TaiXuanShenGongAr:Array = new Array();
         var GuiLiuZhenAr:Array = new Array();
         var LianQiAr:Array = new Array();
         var WuXingQuanAr:Array = new Array();
         var ChiXueMoZhenAr:Array = new Array();
         var RouShenAr:Array = new Array();
         var ShiCongAr:Array = new Array();
         var XueYinJueXingAr:Array = new Array();
         var XueDaoXinFaAr:Array = new Array();
         var QiMenZhenAr:Array = new Array();
         var BiHaiChaoShengQuAr:Array = new Array();
         var BaZhenTuAr:Array = new Array();
         var LingXiYiZhiAr:Array = new Array();
         var JinGangFuMoQuanAr:Array = new Array();
         var ZhenWuQiJieZhenAr:Array = new Array();
         var XiuWeiAr:Array = new Array();
         var GanJiangMoYeAr:Array = new Array();
         var BeiDouQiXingZhenAr:Array = new Array();
         var HuaShanLunJianAr:Array = new Array();
         var BeiMingShenGongAr:Array = new Array();
         var FuMoZhangFaAr:Array = new Array();
         var JiuYinZhenJingAr:Array = new Array();
         var DuGuJiuJianAr:Array = new Array();
         var YunChengAr:Array = new Array();
         var WuXingZhiRenAr:Array = new Array();
         var SLZ_HDZBAr:Array = new Array();
         var ZhuXunzhangAr:Array = new Array();
         var WuXingZhenAr:Array = new Array();
         var anQiAr:Array = new Array();
         var HanBingShenZhangAr:Array = new Array();
         var bowArr:Array = new Array();
         var bowYN:Array = new Array();
         var wuxingzhirenYN:Array = new Array();
         var douzhuanxingyiYN:Array = new Array();
         var QiShaZhenAr:Array = new Array();
         var XingXiuZhenAr:Array = new Array();
         var RiJinLunAr:Array = new Array();
         var JinfengdiaoAr:Array = new Array();
         var JiangHunCN:Array = new Array();
         var MingyueCN:Array = new Array();
         var RongQingAiYi:Array = new Array();
         var XiSuiJing:Array = new Array();
         var SiJueJianZhenAr:Array = new Array();
         var GuiHunArr:Array = new Array();
         var ar:Array = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         var i:int = 0;
         while(i < ar.length)
         {
            if(ItemPositionRange.POSITION_XUNZHANG_ALL.indexOf(ar[i].res.position) != -1)
            {
               wulizhiAr.push(ar[i]);
            }
            if(ItemPositionRange.POSITION_ZHANQI_ALL.indexOf(ar[i].res.position) != -1)
            {
               zhanqiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_JINZHONGZHAO1 || ar[i].res.position == ItemPositionRange.POSTION_JINZHONGZHAO2)
            {
               CJTBSAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_CHAOFANTUOSU || ar[i].res.position == ItemPositionRange.POSTION_NIEPANCHONGSHENG || ar[i].res.position == ItemPositionRange.POSTION_JINGJIE_XUANYUANSHENJIAN)
            {
               TSJJAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_BAGUAHULU)
            {
               BGHLAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_XIANGLONGSHIBAZHANG1 || ar[i].res.position == ItemPositionRange.POSTION_20180926XUNZHANG_15 || ar[i].res.position == ItemPositionRange.POSTION_XIANGLONGSHIBAZHANG2 || ar[i].res.position == ItemPositionRange.POSTION_20180926XUNZHANG_16)
            {
               XLSBZAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_SILINGZHEN1 || ar[i].res.position == ItemPositionRange.POSTION_SILINGZHEN2)
            {
               SLZ_HDZBAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHENZHUXUNZHANG)
            {
               ZhuXunzhangAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI1 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI2 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI3 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI4 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI5 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHEN_BAJIAOSHAN)
            {
               WuXingZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ANQI_DUOMINGCHIZHEN || ar[i].res.position == ItemPositionRange.POSTION_20171115KONGQUEYUPEI)
            {
               anQiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_BOW_ZHUANGBEI1 || ar[i].res.position == ItemPositionRange.POSTION_BOW_ZHUANGBEI2)
            {
               bowArr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSITION_LIANZHOUNU)
            {
               bowYN.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_ZHUANGBEI1 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_ZHUANGBEI2 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_ZHUANGBEI3 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_ZHUANGBEI4)
            {
               TianMenZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_HUTAOZHEN_ZHENHUNXUNZHANG1 || ar[i].res.position == ItemPositionRange.POSTION_HUTAOZHEN_ZHENHUNXUNZHANG2 || ar[i].res.position == ItemPositionRange.POSTION_HUTAOZHEN_ZHENHUNXUNZHANG3 || ar[i].res.position == ItemPositionRange.POSTION_HUTAOZHEN_ZHENHUNXUNZHANG4)
            {
               HuTaoZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE1 || ar[i].res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE2 || ar[i].res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE3 || ar[i].res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE4 || ar[i].res.position == ItemPositionRange.POSTION_QINLONGGONG_JUEXUE5)
            {
               QinLongGongAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING1 || ar[i].res.position == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING2 || ar[i].res.position == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING3 || ar[i].res.position == ItemPositionRange.POSTION_JUEZHANGUANGMINGDING4)
            {
               JueZhanGuangMingDingAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_YUNLONGZHEN1 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_YUNLONGZHEN2 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_YUNLONGZHEN3 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_YUNLONGZHEN4)
            {
               YunLongZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_CHANGSHEZHEN1 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_CHANGSHEZHEN2 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_CHANGSHEZHEN3 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_CHANGSHEZHEN4)
            {
               ChangSheZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_YIJINJING_DONGFANG1 || ar[i].res.position == ItemPositionRange.POSTION_YIJINJING_NANFANG2 || ar[i].res.position == ItemPositionRange.POSTION_YIJINJING_XIFANG3 || ar[i].res.position == ItemPositionRange.POSTION_YIJINJING_BEIFANG4 || ar[i].res.position == ItemPositionRange.POSTION_XICHUANHONGMIANBAIHUAPAO || ar[i].res.position == ItemPositionRange.POSTION_20171115NIZHUANYIJINJING)
            {
               YiJinJingAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_XUANTIEJIANFA_HOU || ar[i].res.position == ItemPositionRange.POSTION_XUANTIEJIANFA_HUFA || ar[i].res.position == ItemPositionRange.POSTION_XUANTIEJIANFA_QIAN || ar[i].res.position == ItemPositionRange.POSTION_XUANTIEJIANFA_ZHONG)
            {
               XuanTieJianFaAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_YANYUEZHEN1 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_YANYUEZHEN2 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_YANYUEZHEN3 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_YANYUEZHEN4)
            {
               YanYueZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN1 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN2 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN3 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN4)
            {
               XuanXiangZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_CANHEZHI_CANHEWUJUE)
            {
               CanHeZhiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_JIUQUHUANGHE_LIANHUAN)
            {
               JiuQuHuangHeZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_XIANTIANGONG_XIANTIANQIJUE)
            {
               XianTianGongAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_CHANGSHENGJUE_NIFANXIANJUE || ar[i].res.position == ItemPositionRange.POSTION_CHANGSHENGJUE_SHENMOFU || ar[i].res.position == ItemPositionRange.POSTION_MIETIANPAO)
            {
               ChangShengJueAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_TAIXUANSHENGONG_QINGMULINGQUAN || ar[i].res.position == ItemPositionRange.POSTION_TAIXUANSHENGONG_DUGUQIUBAI || ar[i].res.position == ItemPositionRange.POSTION_TAIXUANSHENGONG_FENGQINGYANG || ar[i].res.position == ItemPositionRange.POSTION_TAIXUANSHENGONG_LINGHUCHONG)
            {
               TaiXuanShenGongAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_GUILIUZHEN_SHIHUNTIANGUI)
            {
               GuiLiuZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHIREN_WUXINGZHUANLUN || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE1 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE2 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE3 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE4 || ar[i].res.position == ItemPositionRange.POSTION_WUXINGZHIREN_JUEXUE5)
            {
               WuXingZhiRenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_LIANQI_HUPOSHENDAO || ar[i].res.position == ItemPositionRange.POSTION_LIANQI_SHENXIAN1 || ar[i].res.position == ItemPositionRange.POSTION_LIANQI_SHENXIAN2 || ar[i].res.position == ItemPositionRange.POSTION_LIANQI_SHENXIAN3 || ar[i].res.position == ItemPositionRange.POSTION_LIANQI_SHENXIAN4)
            {
               LianQiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_WUXINGQUAN_LIANYAOHU_ID)
            {
               WuXingQuanAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_CHIXUEMOZHEN_MOJIAN_ID || ar[i].res.position == ItemPositionRange.POSTION_CHIXUEMOZHEN_XIELONGMOJIAN_ID)
            {
               ChiXueMoZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ROUSHEN_LIUJINYANMO_ID)
            {
               RouShenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_SHICONG_MOSHENFU)
            {
               ShiCongAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_XUEYINJUEXING_ZIQI1 || ar[i].res.position == ItemPositionRange.POSTION_XUEYINJUEXING_ZIQI2 || ar[i].res.position == ItemPositionRange.POSTION_XUEYINJUEXING_ZIQI3)
            {
               XueYinJueXingAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_XUEDAO_SHIXUEKUANGDAO || ar[i].res.position == ItemPositionRange.POSTION_XUEDAO_MINGHUN || ar[i].res.position == ItemPositionRange.POSTION_XUEDAO_SIPO || ar[i].res.position == ItemPositionRange.POSTION_XUEDAO_TAOWU)
            {
               XueDaoXinFaAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_QIMENZHEN_CIYUANHU || ar[i].res.position == ItemPositionRange.POSTION_QIMENZHEN_LONGZUZHISHEN)
            {
               QiMenZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_BIHAICHAOSHENGQU_HANGUANG)
            {
               BiHaiChaoShengQuAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_BAZHENTU_SUIHUNYINXUE || ar[i].res.position == ItemPositionRange.POSTION_BAZHENTU_SUIHUNZHISHANG)
            {
               BaZhenTuAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_LINGXIYIZHI_XUEWU)
            {
               LingXiYiZhiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_JINGANGFUMOQUAN_FENGLEI)
            {
               JinGangFuMoQuanAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSITION_JGFMQ1 || ar[i].res.position == ItemPositionRange.POSTION_20180926XUNZHANG_17)
            {
               JinGangFuMoQuanAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSITION_JGFMQ2 || ar[i].res.position == ItemPositionRange.POSTION_20180926XUNZHANG_14)
            {
               JinGangFuMoQuanAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_MODAO || ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_JULONGZHIJI || ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_CHANGHONGJIANZHU || ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BINGPOJIANZHU || ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_ZIYUNJIANZHU || ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_YUHUAJIANZHU || ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BENLEIJIANZHU || ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QINGGUANGJIANZHU || ar[i].res.position == ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QUANFENGJIANZHU)
            {
               ZhenWuQiJieZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_XIUWEI_BINGJINGHU || ar[i].res.position == ItemPositionRange.POSTION_20171115YINGXIONGLISHI)
            {
               XiuWeiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_GANJIANGMOYE_RIYUESHENJIAN || ar[i].res.position == ItemPositionRange.POSTION_GANJIANGMOYE_XIALVTUMO)
            {
               GanJiangMoYeAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_BEIDOUQIXINGZHEN_SHUSHANSHENQI)
            {
               BeiDouQiXingZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_HUASHANLUNJIAN_NIYAN)
            {
               HuaShanLunJianAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_HANBINGSHENZHANG_LILONG || ar[i].res.position == ItemPositionRange.POSTION_HANBINGSHENZHANG_BINGJINGCHUI)
            {
               HanBingShenZhangAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_BEIMINGSHENGONG_DIHUANGYUXI || ar[i].res.position == ItemPositionRange.POSTION_BEIMINGSHENGONG_LIUXINGLUO || ar[i].res.position == ItemPositionRange.POSTION_LIHEJUEDAFAXUNZHANG)
            {
               BeiMingShenGongAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_FUMOZHANGFA_TIANLONG)
            {
               FuMoZhangFaAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_JIUYINZHENJING_SHIHUNQI)
            {
               JiuYinZhenJingAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_DUGUJIUJIAN_LONGHUNJIAN || ar[i].res.position == ItemPositionRange.POSTION_DUGUJIUJIAN_SHOUWEIHUDUN)
            {
               DuGuJiuJianAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_YUNCHENG_SHENGXIAOFUBENLING)
            {
               YunChengAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN1 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN2 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN3 || ar[i].res.position == ItemPositionRange.POSTION_ZHENFA_HEYIZHEN4)
            {
               HeYiZhenAr.push(ar[i]);
            }
            if(ar[i].res.position > 11000 && ar[i].res.position < 12000)
            {
               AoJianShenJiangJiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_MINGJIAOJIAOZHU || ar[i].res.position == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_TULONGDAO || ar[i].res.position == ItemPositionRange.POSTION_AOJIANSHENJIANGJI_YITIANJIAN)
            {
               MingJiaoZhangWuJiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_QIANKUNJIA)
            {
               douzhuanxingyiYN.push(ar[i]);
            }
            if(ar[i].res.position > 3630 && ar[i].res.position < 3637)
            {
               wuxingzhirenYN.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_QISHAZHEN_ZIYANSHENQI || ItemPositionRange.POSTION_QISHAZHEN_SHENQI.indexOf(ar[i].res.position) != -1)
            {
               QiShaZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_XINGXIUZHEN_BEIMINGZHIREN)
            {
               XingXiuZhenAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_MINGYUEZHANG)
            {
               RiJinLunAr.push(ar[i]);
            }
            if(ItemPositionRange.POSITION_JINFENGDIAO.indexOf(ar[i].res.position) != -1)
            {
               JinfengdiaoAr.push(ar[i]);
            }
            if(ItemPositionRange.POSTION_JIANGHUN_ZHAOYUN_RONGQI_CN.indexOf(ar[i].res.position) != -1)
            {
               JiangHunCN.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_MINGYUEZHANG)
            {
               MingyueCN.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_20171115RONGQINGAIYI)
            {
               RongQingAiYi.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_20171115XISUIHUAYUANJUE)
            {
               XiSuiJing.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_SIJUEJIANZHEN_BADAO)
            {
               SiJueJianZhenAr.push(ar[i]);
            }
            if(ar[i].res.position >= ItemPositionRange.POSTION_GUIHUN_ARR.x && ar[i].res.position <= ItemPositionRange.POSTION_GUIHUN_ARR.y)
            {
               GuiHunArr.push(ar[i]);
            }
            i++;
         }
         this.mainCharArrtibutePlane.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         this.mainCharArrtibutePlane.setWuliItems(wulizhiAr);
         this.mainCharArrtibutePlane.setZhanqiItems(zhanqiAr);
         this.mainCharArrtibutePlane.set_CJTBS(CJTBSAr);
         this.mainCharArrtibutePlane.set_TSJJ(TSJJAr);
         this.mainCharArrtibutePlane.set_BGHL(BGHLAr);
         this.mainCharArrtibutePlane.set_XLSBZ(XLSBZAr);
         this.mainCharArrtibutePlane.set_SLZ_HDZB(SLZ_HDZBAr);
         this.mainCharArrtibutePlane.set_ZhuXunzhang(ZhuXunzhangAr);
         this.mainCharArrtibutePlane.set_WuXingZhen(WuXingZhenAr);
         this.mainCharArrtibutePlane.setAnQiZhuangBei(anQiAr);
         this.mainCharArrtibutePlane.setBowEquip(bowArr);
         this.mainCharArrtibutePlane.setYNBowEquip(bowYN);
         this.mainCharArrtibutePlane.set_TianMenZhen(TianMenZhenAr);
         this.mainCharArrtibutePlane.set_HanBingShenZhang(HanBingShenZhangAr);
         this.mainCharArrtibutePlane.set_HuTaoZhen(HuTaoZhenAr);
         this.mainCharArrtibutePlane.set_QinLongGong(QinLongGongAr);
         this.mainCharArrtibutePlane.set_AoJianShenJiangJi(AoJianShenJiangJiAr);
         this.mainCharArrtibutePlane.set_MingJiaoZhangWuJi(MingJiaoZhangWuJiAr);
         this.mainCharArrtibutePlane.set_JueZhanGuangMingDing(JueZhanGuangMingDingAr);
         this.mainCharArrtibutePlane.set_YunLongZhen(YunLongZhenAr);
         this.mainCharArrtibutePlane.set_ChangSheZhen(ChangSheZhenAr);
         this.mainCharArrtibutePlane.set_YiJinJing(YiJinJingAr);
         this.mainCharArrtibutePlane.set_XuanTieJianFa(XuanTieJianFaAr);
         this.mainCharArrtibutePlane.set_YanYueZhen(YanYueZhenAr);
         this.mainCharArrtibutePlane.set_HeYiZhen(HeYiZhenAr);
         this.mainCharArrtibutePlane.set_XuanXiangZhen(XuanXiangZhenAr);
         this.mainCharArrtibutePlane.set_CanHeZhi(CanHeZhiAr);
         this.mainCharArrtibutePlane.set_JiuQuHuangHeZhen(JiuQuHuangHeZhenAr);
         this.mainCharArrtibutePlane.set_XianTianGong(XianTianGongAr);
         this.mainCharArrtibutePlane.set_ChangShengJue(ChangShengJueAr);
         this.mainCharArrtibutePlane.set_TaiXuanShenGong(TaiXuanShenGongAr);
         this.mainCharArrtibutePlane.set_GuiLiuZhen(GuiLiuZhenAr);
         this.mainCharArrtibutePlane.set_LianQi(LianQiAr);
         this.mainCharArrtibutePlane.set_WuXingQuan(WuXingQuanAr);
         this.mainCharArrtibutePlane.set_ChiXueMoZhen(ChiXueMoZhenAr);
         this.mainCharArrtibutePlane.set_RouShen(RouShenAr);
         this.mainCharArrtibutePlane.set_XueYinJueXing(XueYinJueXingAr);
         this.mainCharArrtibutePlane.set_XueDaoXinFa(XueDaoXinFaAr);
         this.mainCharArrtibutePlane.set_QiMenZhen(QiMenZhenAr);
         this.mainCharArrtibutePlane.set_BiHaiChaoShengQu(BiHaiChaoShengQuAr);
         this.mainCharArrtibutePlane.set_BaZhenTu(BaZhenTuAr);
         this.mainCharArrtibutePlane.set_LingXiYiZhi(LingXiYiZhiAr);
         this.mainCharArrtibutePlane.set_JinGangFuMoQuan(JinGangFuMoQuanAr);
         this.mainCharArrtibutePlane.set_JinGangFuMoQuan1(JinGangFuMoQuanAr);
         this.mainCharArrtibutePlane.set_ZhenWuQiJieZhen(ZhenWuQiJieZhenAr);
         this.mainCharArrtibutePlane.set_XiuWei(XiuWeiAr);
         this.mainCharArrtibutePlane.set_GanJiangMoYe(GanJiangMoYeAr);
         this.mainCharArrtibutePlane.set_BeiDouQiXingZhen(BeiDouQiXingZhenAr);
         this.mainCharArrtibutePlane.set_HuaShanLunJian(HuaShanLunJianAr);
         this.mainCharArrtibutePlane.set_BeiMingShenGong(BeiMingShenGongAr);
         this.mainCharArrtibutePlane.set_FuMoZhangFa(FuMoZhangFaAr);
         this.mainCharArrtibutePlane.set_JiuYinZhenJing(JiuYinZhenJingAr);
         this.mainCharArrtibutePlane.set_DuGuJiuJian(DuGuJiuJianAr);
         this.mainCharArrtibutePlane.set_YunCheng(YunChengAr);
         this.mainCharArrtibutePlane.set_WuXingZhiRen(WuXingZhiRenAr);
         this.mainCharArrtibutePlane.setZhuangbei2(wuxingzhirenYN);
         this.mainCharArrtibutePlane.setDouzhuangxingyiZhuangbei(douzhuanxingyiYN);
         this.mainCharArrtibutePlane.set_QiShaZhen(QiShaZhenAr);
         this.mainCharArrtibutePlane.set_XingXiuZhen(XingXiuZhenAr);
         this.mainCharArrtibutePlane.set_Rijinlun(RiJinLunAr);
         this.mainCharArrtibutePlane.set_YNJinfengdiao(JinfengdiaoAr);
         GameInstance.uiInstance.jiangHunCNPanel.set_JiangHun(JiangHunCN);
         this.mainCharArrtibutePlane.set_RongQingAiYi(RongQingAiYi);
         this.mainCharArrtibutePlane.set_XiSuiJing(XiSuiJing);
         this.mainCharArrtibutePlane.set_SiJueJianZhen(SiJueJianZhenAr);
         this.mainCharArrtibutePlane.set_GuiHun(GuiHunArr);
         bodyArr = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         booArr = ExchangePositionManager.getEquipStatus(bodyArr,function():void
         {
         },function():void
         {
         },function():void
         {
         });
         if(booArr.length > 0)
         {
            this.mainCharArrtibutePlane.setICOState(booArr[0][0],booArr[0][1],booArr[1][0],booArr[1][1],booArr[2][0],booArr[2][1],booArr[3][0],booArr[3][1],booArr[4][0],booArr[4][1],booArr[5][0],booArr[5][1],booArr[6][0],booArr[6][1],booArr[7][0],booArr[7][1]);
         }
         else
         {
            this.mainCharArrtibutePlane.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         }
         if(GameInstance.mainCharData.attributeInfo.taoZhuang)
         {
            this.mainCharArrtibutePlane.setSiShengShouState(12,12,12,12);
         }
         else
         {
            siShengShouArr = ExchangePositionManager.getSiShengShouStatus(bodyArr);
            if(siShengShouArr.length > 0)
            {
               this.mainCharArrtibutePlane.setSiShengShouState(siShengShouArr[0],siShengShouArr[1],siShengShouArr[2],siShengShouArr[3]);
            }
            else
            {
               this.mainCharArrtibutePlane.setSiShengShouState(0,0,0,0);
            }
         }
         this.setYuPeiItem();
         this.mainCharArrtibutePlane.setICOXiantian(GameInstance.mainCharData.attributeInfo.isJiHuoXianTianWuJing == 1,GameInstance.mainCharData.attributeInfo.useTianShengNeiliCount,GameInstance.mainCharData.attributeInfo.shenNongBaiChaoDanSta,GameInstance.mainCharData.attributeInfo.qianNengXinFaSta);
         this.mainCharArrtibutePlane.setICORouti(GameInstance.mainCharData.attributeInfo.isJiHuoRoutiJinshen);
         this.mainCharArrtibutePlane.setICOWuhun(GameInstance.mainCharData.attributeInfo.useWuhundanCount,GameInstance.mainCharData.attributeInfo.isWuHunShengJiDanJiHuo,GameInstance.mainCharData.attributeInfo.isHuoHunDanJiHuo,GameInstance.mainCharData.attributeInfo.wuHunShenDan,GameInstance.mainCharData.attributeInfo.isLongHunWuPoJiHuo,GameInstance.mainCharData.attributeInfo.longHunShenDan,GameInstance.mainCharData.attributeInfo.isShenFuMiJi,GameInstance.mainCharData.attributeInfo.isNeitishenqi,GameInstance.mainCharData.attributeInfo.neitishenqi);
         this.mainCharArrtibutePlane.setICOHuXinYao(GameInstance.mainCharData.attributeInfo.isHuXinYaoJiHuo);
         this.mainCharArrtibutePlane.setICONiXi(GameInstance.mainCharData.attributeInfo.niXiStatus);
         this.mainCharArrtibutePlane.setICOFengHuang(GameInstance.mainCharData.attributeInfo.fengHuang);
      }
      
      public function setHPMP(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         this.mainCharArrtibutePlane.setHPMP(param1,param2,param3,param4,param5,param6);
      }
      
      public function setSkillValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:int, param6:int) : void
      {
         this.mainCharArrtibutePlane.setSkillValue(param1,param2,param3,param4,param5,param6);
      }
      
      public function setPoint(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.mainCharArrtibutePlane.setPoint(param1,param2,param3,param4,param5);
      }
      
      public function setFlag(param1:int) : void
      {
         this.mainCharArrtibutePlane.setFlag(param1);
      }
      
      public function setIsShowBiaoqian(param1:int) : void
      {
         this.mainCharArrtibutePlane.setIsShowBiaoqian(param1);
      }
      
      public function setStarSta(param1:int) : void
      {
         this.mainCharArrtibutePlane.setStarSta(param1);
      }
      
      public function setStatusByString(param1:String) : void
      {
         this.mainCharArrtibutePlane.setStatusByString(param1);
      }
      
      public function initTianFuSystem(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.permitTianFu(param1);
      }
      
      public function setYuPeiItem() : void
      {
         var _loc2_:Goods = null;
         var _loc1_:int = GameInstance.mainCharData.attributeInfo.showYuPeiGoodsId;
         if(_loc1_ > 0)
         {
            _loc2_ = new Goods(_loc1_);
            _loc2_.position = _loc2_.res.position;
            _loc2_.roleID = GameInstance.mainChar.id;
            this.mainCharArrtibutePlane.setYupei(_loc2_);
         }
         else
         {
            this.mainCharArrtibutePlane.setYupei();
         }
      }
      
      public function showTiHuanTips(param1:int, param2:int) : void
      {
         var goodsId:int = param1;
         var postion:int = param2;
         FAlert.okLabel = LanResManager.getLanCommonTextWords("是");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("否");
         FAlert.show(LanResManager.getLanCommonTextWords("确定使用该物品吗？如果存在低阶物品会被替换。"),"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               senderProxy.send_52355([goodsId,postion]);
            }
         });
      }
   }
}

