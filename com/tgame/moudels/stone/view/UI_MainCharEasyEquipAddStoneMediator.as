package com.tgame.moudels.stone.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.stone.Stone_ApplicationFacade;
   import com.tgame.moudels.stone.model.Stone_MsgSendProxy;
   import com.tgame.shell.view.components.StoneOptionSmallPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_MainCharEasyEquipAddStoneMediator extends Mediator
   {
      
      public static const NAME:String = "UI_MainCharEasyEquipAddStone";
      
      private var tempType:int = 0;
      
      private var equip:Goods;
      
      private var stone:Goods;
      
      private var isPanelUse:Boolean = false;
      
      private var isCaidanXiangqian:Boolean = false;
      
      private var _sendMsg:Stone_MsgSendProxy;
      
      public function UI_MainCharEasyEquipAddStoneMediator()
      {
         super(NAME);
      }
      
      protected function get easyStonePanel() : StoneOptionSmallPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.stoneOptionSmallPanel);
         }
         return viewComponent as StoneOptionSmallPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Stone_ApplicationFacade.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE,Stone_ApplicationFacade.EASY_EQUIP_ADD_STONE,Stone_ApplicationFacade.ITEM_SWAP_OR_MOVE,Stone_ApplicationFacade.MENU_XIANGQIAN,Stone_ApplicationFacade.SUPER_XIANGQIAN,Stone_ApplicationFacade.MENU_XIANGQIAN_FANHUI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Stone_ApplicationFacade.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE:
               this.tempType = 0;
               if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
               {
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
                  return;
               }
               if(UI_MainCharStoneMediator.loaderBuff)
               {
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
                  return;
               }
               this.openBackpack();
               this.easyStonePanel.setItem([]);
               this.easyStonePanel.setFengKuang();
               this.easyStonePanel.setYangshi(1);
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
               this.equip = _loc2_ as Goods;
               this.send50125(this.equip);
               break;
            case Stone_ApplicationFacade.SUPER_XIANGQIAN:
               this.tempType = 121;
               if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
               {
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
                  return;
               }
               if(UI_MainCharStoneMediator.loaderBuff)
               {
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
                  return;
               }
               this.openBackpack();
               this.easyStonePanel.setItem([]);
               this.easyStonePanel.setFengKuang();
               this.easyStonePanel.setYangshi(121);
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
               this.equip = _loc2_ as Goods;
               this.send50125(this.equip,23);
               break;
            case Stone_ApplicationFacade.EASY_EQUIP_ADD_STONE:
               _loc3_ = _loc2_.idArr;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc5_ = _loc3_[_loc4_][0] as Goods;
                  _loc5_.position = this.equip.position * 100 + _loc3_[_loc4_][1];
                  _loc5_.roleID = GameInstance.mainChar.id;
                  _loc4_++;
               }
               this.easyStonePanel.setItem(_loc3_);
               if(this.equip.id == SpecialGoodsID.ZUIZHONGXUNZHANG || this.equip.id == SpecialGoodsID.KUAPINGTAI_JINIAN_HUIZHUANG || this.equip.id == SpecialGoodsID.KUAPINGTAI_WANGZHE_HUIZHUANG)
               {
                  this.easyStonePanel.setYangshi(3);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUNDUNXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(4);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.KUNSHOUZHIDOUXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(5);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.SUDUZHIXINGXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(6);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YUMOZHANSHIXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(7);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.WUXIANGSHENGONGXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(8);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.WANJIANGUIZHONGXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(9);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.BIWUBAZHUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(11);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XUETIANMOGONGXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(34);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.BIWUBAZHUXUNZHANG_16)
               {
                  this.easyStonePanel.setYangshi(12);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.MENGHUANBAZHU)
               {
                  this.easyStonePanel.setYangshi(13);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.BEIDOUXINGCHEN)
               {
                  this.easyStonePanel.setYangshi(14);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUMOSHENJIA)
               {
                  this.easyStonePanel.setYangshi(15);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.DAGOUBANG)
               {
                  this.easyStonePanel.setYangshi(16);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.SHENDAOYINXUE)
               {
                  this.easyStonePanel.setYangshi(21);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.QINGLONGYANYUE)
               {
                  this.easyStonePanel.setYangshi(22);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.POJUNCANGLONG)
               {
                  this.easyStonePanel.setYangshi(36);
                  this.easyStonePanel.setFengKuang(0);
               }
               else if(this.equip.id == SpecialGoodsID.LANYUPANLONGGUN)
               {
                  this.easyStonePanel.setYangshi(35);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YUANYUEWANDAO)
               {
                  this.easyStonePanel.setYangshi(48);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.WUXINGSHENLONG)
               {
                  this.easyStonePanel.setYangshi(42);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.JIDAOQIANKUN)
               {
                  this.easyStonePanel.setYangshi(43);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.ZIWUQIXING)
               {
                  this.easyStonePanel.setYangshi(44);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.TULONGMOYING)
               {
                  this.easyStonePanel.setYangshi(45);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LUTUWANREN)
               {
                  this.easyStonePanel.setYangshi(46);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LIETIANBAWANGJI)
               {
                  this.easyStonePanel.setYangshi(49);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.POXIAOLANYUE)
               {
                  this.easyStonePanel.setYangshi(50);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUNDUNYOULONGQIANG)
               {
                  this.easyStonePanel.setYangshi(52);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.JIETIAN)
               {
                  this.easyStonePanel.setYangshi(53);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LUOHANFUTIXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(47);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YINGXIONGHUFU)
               {
                  this.easyStonePanel.setYangshi(51);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.ZHUXIAN)
               {
                  this.easyStonePanel.setYangshi(54);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUANGJINJIAN)
               {
                  this.easyStonePanel.setYangshi(64);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HONGLIAN)
               {
                  this.easyStonePanel.setYangshi(66);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.CHIYAN)
               {
                  this.easyStonePanel.setYangshi(67);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.POTIAN)
               {
                  this.easyStonePanel.setYangshi(70);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LUOSHENJIAN)
               {
                  this.easyStonePanel.setYangshi(71);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.TIANZHU)
               {
                  this.easyStonePanel.setYangshi(72);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.ZIYINGJIAN)
               {
                  this.easyStonePanel.setYangshi(73);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HONGMO)
               {
                  this.easyStonePanel.setYangshi(84);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUANGTUBAYEHUANGSHI)
               {
                  this.easyStonePanel.setYangshi(86);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YANTIAN)
               {
                  this.easyStonePanel.setYangshi(87);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.PANGUKAITIANFU)
               {
                  this.easyStonePanel.setYangshi(89);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.NIYAN)
               {
                  this.easyStonePanel.setYangshi(90);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.CHUANGSHI)
               {
                  this.easyStonePanel.setYangshi(92);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XUANYUANSHENJIAN)
               {
                  this.easyStonePanel.setYangshi(93);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LIANYAOHU)
               {
                  this.easyStonePanel.setYangshi(94);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.CHIXIAO)
               {
                  this.easyStonePanel.setYangshi(95);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LONGWANGSANCHAJI)
               {
                  this.easyStonePanel.setYangshi(97);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.MOJIAN)
               {
                  this.easyStonePanel.setYangshi(96);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.JIUYUEXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(98);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.BINGJINGCHUI)
               {
                  this.easyStonePanel.setYangshi(99);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUOYUN)
               {
                  this.easyStonePanel.setYangshi(100);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.SHENMO)
               {
                  this.easyStonePanel.setYangshi(101);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.MODAO)
               {
                  this.easyStonePanel.setYangshi(102);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YUANJIANLINGPO)
               {
                  this.easyStonePanel.setYangshi(103);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.BAJIAOSHAN)
               {
                  this.easyStonePanel.setYangshi(104);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XIALVTUMO)
               {
                  this.easyStonePanel.setYangshi(105);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.FENGLEI)
               {
                  this.easyStonePanel.setYangshi(106);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LIUXINGLUO)
               {
                  this.easyStonePanel.setYangshi(107);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XIELONGMOJIAN)
               {
                  this.easyStonePanel.setYangshi(108);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XUEWU)
               {
                  this.easyStonePanel.setYangshi(109);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.JULONGZHIJI)
               {
                  this.easyStonePanel.setYangshi(110);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HANGUANG)
               {
                  this.easyStonePanel.setYangshi(112);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.SUIHUNYINXUE)
               {
                  this.easyStonePanel.setYangshi(111);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.TAOWUNEIDAN)
               {
                  this.easyStonePanel.setYangshi(113);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XIANGYANSHUAIYIN)
               {
                  this.easyStonePanel.setYangshi(91);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.JUNQI)
               {
                  this.easyStonePanel.setYangshi(88);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.FUMOZHANGFA_TIANLONG)
               {
                  this.easyStonePanel.setYangshi(74);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.MINGJIAOHUSHENFU)
               {
                  this.easyStonePanel.setYangshi(75);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LIHUAQIANG)
               {
                  this.easyStonePanel.setYangshi(76);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.SHENBINGFU)
               {
                  this.easyStonePanel.setYangshi(77);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.TIANJING)
               {
                  this.easyStonePanel.setYangshi(78);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.TULONGDAO)
               {
                  this.easyStonePanel.setYangshi(79);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XIONGBAXUNZHUANG)
               {
                  this.easyStonePanel.setYangshi(80);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.NIEFENGXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(81);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.BUJINGYUNXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(82);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.QINSHUANGXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(83);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LINGHUNBAIDUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(85);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.DUANHUN)
               {
                  this.easyStonePanel.setYangshi(68);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.FENGLEIHUSHENFU)
               {
                  this.easyStonePanel.setYangshi(69);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.LONGZHUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(65);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.DAOGUXIANFENG)
               {
                  this.easyStonePanel.setYangshi(57);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.SHISHEN)
               {
                  this.easyStonePanel.setYangshi(56);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.WUYINGJIAN)
               {
                  this.easyStonePanel.setYangshi(58);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.MINGHONGDAO)
               {
                  this.easyStonePanel.setYangshi(59);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.JINGU)
               {
                  this.easyStonePanel.setYangshi(62);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUTAOZHENHUNXUNZHANG1)
               {
                  this.easyStonePanel.setYangshi(63);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUTAOZHENHUNXUNZHANG2)
               {
                  this.easyStonePanel.setYangshi(63);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUTAOZHENHUNXUNZHANG3)
               {
                  this.easyStonePanel.setYangshi(63);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUTAOZHENHUNXUNZHANG4)
               {
                  this.easyStonePanel.setYangshi(63);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.QIYUEBAZHUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(60);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.QIYUEBAZHUXUNZHANG_CHUANCHENG)
               {
                  this.easyStonePanel.setYangshi(61);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUANGQUANBAZHUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(55);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.TIANFAAOJIAN)
               {
                  this.easyStonePanel.setYangshi(40);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XUESHAGUXING)
               {
                  this.easyStonePanel.setYangshi(41);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUANGJINKAITIANFU)
               {
                  this.easyStonePanel.setYangshi(37);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUANGJINXINGTIAN)
               {
                  this.easyStonePanel.setYangshi(38);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.JIHUOHUANGZHEN)
               {
                  this.easyStonePanel.setYangshi(39);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.ZIJINGZHONGJIAN || this.equip.id == SpecialGoodsID.ZIJINGZHONGJIAN_KAIGUANG)
               {
                  this.easyStonePanel.setYangshi(33);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUANGJINYANYUE)
               {
                  this.easyStonePanel.setYangshi(30);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.QUAN_SHEN || this.equip.id == SpecialGoodsID.QUANSHEN_JIHUO)
               {
                  this.easyStonePanel.setYangshi(23);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.AOJIANWUSHUANGXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(10);
                  this.easyStonePanel.setFengKuang(1);
               }
               else if(SpecialGoodsID.XUANYUANTIAN_ID.indexOf(this.equip.id) != -1)
               {
                  this.easyStonePanel.setYangshi(17);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(SpecialGoodsID.XUANYUANDI_ID.indexOf(this.equip.id) != -1)
               {
                  this.easyStonePanel.setYangshi(18);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(SpecialGoodsID.XUANYUANREN_ID.indexOf(this.equip.id) != -1)
               {
                  this.easyStonePanel.setYangshi(19);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(SpecialGoodsID.AOJIAN_ID.indexOf(this.equip.id) != -1)
               {
                  this.easyStonePanel.setYangshi(20);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.SIWANGSHALOU)
               {
                  this.easyStonePanel.setYangshi(24);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.WULEIHUAJI)
               {
                  this.easyStonePanel.setYangshi(32);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YURENJIE)
               {
                  this.easyStonePanel.setYangshi(31);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.WUHUNTIANSHANG)
               {
                  this.easyStonePanel.setYangshi(25);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.ZHEN_WUHUNTIANSHANG)
               {
                  this.easyStonePanel.setYangshi(26);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YUANSHENYUJIAN)
               {
                  this.easyStonePanel.setYangshi(27);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.HUANGJINXUEYIN)
               {
                  this.easyStonePanel.setYangshi(28);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.XUANTIEZHONGJIAN)
               {
                  this.easyStonePanel.setYangshi(29);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YN2015YUANDAN)
               {
                  this.easyStonePanel.setYangshi(115);
                  this.easyStonePanel.setFengKuang(5);
               }
               else if(this.equip.id == SpecialGoodsID.YN_TONGGU)
               {
                  this.easyStonePanel.setYangshi(116);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YN_BAILONGJIANGSHI)
               {
                  this.easyStonePanel.setYangshi(117);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
               }
               else if(this.equip.id == SpecialGoodsID.YNZHONGJIEZHE)
               {
                  this.easyStonePanel.setYangshi(118);
                  this.easyStonePanel.setFengKuang(5);
               }
               else if(this.tempType == 121)
               {
                  this.easyStonePanel.setYangshi(121);
                  this.easyStonePanel.setFengKuang();
               }
               else
               {
                  this.easyStonePanel.setFengKuang();
                  this.easyStonePanel.setYangshi(1);
               }
               this.isPanelUse = true;
               this.isCaidanXiangqian = true;
               break;
            case Stone_ApplicationFacade.ITEM_SWAP_OR_MOVE:
               if(!this.equip)
               {
                  return;
               }
               _loc3_ = _loc2_ as Array;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  if(_loc3_[_loc4_] == this.equip.position)
                  {
                     PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
                     return;
                  }
                  _loc4_++;
               }
               break;
            case Stone_ApplicationFacade.MENU_XIANGQIAN:
               this.tempType = 0;
               if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
               {
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
                  return;
               }
               if(UI_MainCharStoneMediator.loaderBuff)
               {
                  PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
                  return;
               }
               this.equip = _loc2_ as Goods;
               this.send50125_caidan_xiangqian(this.equip);
               this.openBackpack();
               this.easyStonePanel.setItem([]);
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
               break;
            case Stone_ApplicationFacade.MENU_XIANGQIAN_FANHUI:
               _loc3_ = _loc2_.idArr;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc5_ = _loc3_[_loc4_][0] as Goods;
                  _loc5_.position = this.equip.position * 100 + _loc3_[_loc4_][1];
                  _loc5_.roleID = GameInstance.mainChar.id;
                  _loc4_++;
               }
               if(this.equip.id == 373716)
               {
                  this.easyStonePanel.setYangshi(1);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               else if(this.equip.id == SpecialGoodsID.ZHANJIA_BAIYIN || this.equip.id == SpecialGoodsID.ZHANJIA_HUANGJIN || this.equip.res.position == ItemPositionRange.POSTION_ZHANJIA)
               {
                  this.easyStonePanel.setYangshi(2);
                  this.easyStonePanel.setFengKuang(5);
                  this.isCaidanXiangqian = false;
               }
               if(this.equip.id == SpecialGoodsID.ZUIZHONGXUNZHANG || this.equip.id == SpecialGoodsID.KUAPINGTAI_JINIAN_HUIZHUANG || this.equip.id == SpecialGoodsID.KUAPINGTAI_WANGZHE_HUIZHUANG)
               {
                  this.easyStonePanel.setYangshi(3);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUNDUNXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(4);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.KUNSHOUZHIDOUXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(5);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.SUDUZHIXINGXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(6);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.YUMOZHANSHIXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(7);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.WUXIANGSHENGONGXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(8);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.WANJIANGUIZHONGXUNZHAGN)
               {
                  this.easyStonePanel.setYangshi(9);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.BIWUBAZHUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(11);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.BIWUBAZHUXUNZHANG_16)
               {
                  this.easyStonePanel.setYangshi(12);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XUETIANMOGONGXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(34);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.MENGHUANBAZHU)
               {
                  this.easyStonePanel.setYangshi(13);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.BEIDOUXINGCHEN)
               {
                  this.easyStonePanel.setYangshi(14);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUMOSHENJIA)
               {
                  this.easyStonePanel.setYangshi(15);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.DAGOUBANG)
               {
                  this.easyStonePanel.setYangshi(16);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.SHENDAOYINXUE)
               {
                  this.easyStonePanel.setYangshi(21);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.POJUNCANGLONG)
               {
                  this.easyStonePanel.setYangshi(36);
                  this.easyStonePanel.setFengKuang(0);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.QINGLONGYANYUE)
               {
                  this.easyStonePanel.setYangshi(22);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LANYUPANLONGGUN)
               {
                  this.easyStonePanel.setYangshi(35);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.YUANYUEWANDAO)
               {
                  this.easyStonePanel.setYangshi(48);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.WUXINGSHENLONG)
               {
                  this.easyStonePanel.setYangshi(42);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.JIDAOQIANKUN)
               {
                  this.easyStonePanel.setYangshi(43);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.ZIWUQIXING)
               {
                  this.easyStonePanel.setYangshi(44);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.TULONGMOYING)
               {
                  this.easyStonePanel.setYangshi(45);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LUTUWANREN)
               {
                  this.easyStonePanel.setYangshi(46);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LIETIANBAWANGJI)
               {
                  this.easyStonePanel.setYangshi(49);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.POXIAOLANYUE)
               {
                  this.easyStonePanel.setYangshi(50);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUNDUNYOULONGQIANG)
               {
                  this.easyStonePanel.setYangshi(52);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.JIETIAN)
               {
                  this.easyStonePanel.setYangshi(53);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LUOHANFUTIXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(47);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.YINGXIONGHUFU)
               {
                  this.easyStonePanel.setYangshi(51);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.ZHUXIAN)
               {
                  this.easyStonePanel.setYangshi(54);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUANGJINJIAN)
               {
                  this.easyStonePanel.setYangshi(64);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HONGLIAN)
               {
                  this.easyStonePanel.setYangshi(66);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.CHIYAN)
               {
                  this.easyStonePanel.setYangshi(67);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.POTIAN)
               {
                  this.easyStonePanel.setYangshi(70);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LUOSHENJIAN)
               {
                  this.easyStonePanel.setYangshi(71);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.TIANZHU)
               {
                  this.easyStonePanel.setYangshi(72);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.ZIYINGJIAN)
               {
                  this.easyStonePanel.setYangshi(73);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HONGMO)
               {
                  this.easyStonePanel.setYangshi(84);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUANGTUBAYEHUANGSHI)
               {
                  this.easyStonePanel.setYangshi(86);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.YANTIAN)
               {
                  this.easyStonePanel.setYangshi(87);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.PANGUKAITIANFU)
               {
                  this.easyStonePanel.setYangshi(89);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.NIYAN)
               {
                  this.easyStonePanel.setYangshi(90);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.CHUANGSHI)
               {
                  this.easyStonePanel.setYangshi(92);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XUANYUANSHENJIAN)
               {
                  this.easyStonePanel.setYangshi(93);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LIANYAOHU)
               {
                  this.easyStonePanel.setYangshi(94);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.CHIXIAO)
               {
                  this.easyStonePanel.setYangshi(95);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LONGWANGSANCHAJI)
               {
                  this.easyStonePanel.setYangshi(97);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.MOJIAN)
               {
                  this.easyStonePanel.setYangshi(96);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.JIUYUEXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(98);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.BINGJINGCHUI)
               {
                  this.easyStonePanel.setYangshi(99);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUOYUN)
               {
                  this.easyStonePanel.setYangshi(100);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.SHENMO)
               {
                  this.easyStonePanel.setYangshi(101);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.MODAO)
               {
                  this.easyStonePanel.setYangshi(102);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.YUANJIANLINGPO)
               {
                  this.easyStonePanel.setYangshi(103);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.BAJIAOSHAN)
               {
                  this.easyStonePanel.setYangshi(104);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XIALVTUMO)
               {
                  this.easyStonePanel.setYangshi(105);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.FENGLEI)
               {
                  this.easyStonePanel.setYangshi(106);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LIUXINGLUO)
               {
                  this.easyStonePanel.setYangshi(107);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XIELONGMOJIAN)
               {
                  this.easyStonePanel.setYangshi(108);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XUEWU)
               {
                  this.easyStonePanel.setYangshi(109);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.JULONGZHIJI)
               {
                  this.easyStonePanel.setYangshi(110);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HANGUANG)
               {
                  this.easyStonePanel.setYangshi(112);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.SUIHUNYINXUE)
               {
                  this.easyStonePanel.setYangshi(111);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.TAOWUNEIDAN)
               {
                  this.easyStonePanel.setYangshi(113);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XIANGYANSHUAIYIN)
               {
                  this.easyStonePanel.setYangshi(91);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.JUNQI)
               {
                  this.easyStonePanel.setYangshi(88);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.FUMOZHANGFA_TIANLONG)
               {
                  this.easyStonePanel.setYangshi(74);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.MINGJIAOHUSHENFU)
               {
                  this.easyStonePanel.setYangshi(75);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LIHUAQIANG)
               {
                  this.easyStonePanel.setYangshi(76);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.SHENBINGFU)
               {
                  this.easyStonePanel.setYangshi(77);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.TIANJING)
               {
                  this.easyStonePanel.setYangshi(78);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.TULONGDAO)
               {
                  this.easyStonePanel.setYangshi(79);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XIONGBAXUNZHUANG)
               {
                  this.easyStonePanel.setYangshi(80);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.NIEFENGXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(81);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.BUJINGYUNXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(82);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.QINSHUANGXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(83);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LINGHUNBAIDUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(85);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.DUANHUN)
               {
                  this.easyStonePanel.setYangshi(68);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.FENGLEIHUSHENFU)
               {
                  this.easyStonePanel.setYangshi(69);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.LONGZHUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(65);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.DAOGUXIANFENG)
               {
                  this.easyStonePanel.setYangshi(57);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.SHISHEN)
               {
                  this.easyStonePanel.setYangshi(56);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.WUYINGJIAN)
               {
                  this.easyStonePanel.setYangshi(58);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.MINGHONGDAO)
               {
                  this.easyStonePanel.setYangshi(59);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.JINGU)
               {
                  this.easyStonePanel.setYangshi(62);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUTAOZHENHUNXUNZHANG1)
               {
                  this.easyStonePanel.setYangshi(63);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUTAOZHENHUNXUNZHANG2)
               {
                  this.easyStonePanel.setYangshi(63);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUTAOZHENHUNXUNZHANG3)
               {
                  this.easyStonePanel.setYangshi(63);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUTAOZHENHUNXUNZHANG4)
               {
                  this.easyStonePanel.setYangshi(63);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.QIYUEBAZHUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(60);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.QIYUEBAZHUXUNZHANG_CHUANCHENG)
               {
                  this.easyStonePanel.setYangshi(61);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUANGQUANBAZHUXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(55);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.TIANFAAOJIAN)
               {
                  this.easyStonePanel.setYangshi(40);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XUESHAGUXING)
               {
                  this.easyStonePanel.setYangshi(41);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUANGJINKAITIANFU)
               {
                  this.easyStonePanel.setYangshi(37);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUANGJINXINGTIAN)
               {
                  this.easyStonePanel.setYangshi(38);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.JIHUOHUANGZHEN)
               {
                  this.easyStonePanel.setYangshi(39);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.ZIJINGZHONGJIAN || this.equip.id == SpecialGoodsID.ZIJINGZHONGJIAN_KAIGUANG)
               {
                  this.easyStonePanel.setYangshi(33);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUANGJINYANYUE)
               {
                  this.easyStonePanel.setYangshi(30);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.XUANTIEZHONGJIAN)
               {
                  this.easyStonePanel.setYangshi(29);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.QUANSHEN_JIHUO || this.equip.id == SpecialGoodsID.QUAN_SHEN)
               {
                  this.easyStonePanel.setYangshi(23);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.SIWANGSHALOU)
               {
                  this.easyStonePanel.setYangshi(24);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.WULEIHUAJI)
               {
                  this.easyStonePanel.setYangshi(32);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.YURENJIE)
               {
                  this.easyStonePanel.setYangshi(31);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.WUHUNTIANSHANG)
               {
                  this.easyStonePanel.setYangshi(25);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.ZHEN_WUHUNTIANSHANG)
               {
                  this.easyStonePanel.setYangshi(26);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.YUANSHENYUJIAN)
               {
                  this.easyStonePanel.setYangshi(27);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.HUANGJINXUEYIN)
               {
                  this.easyStonePanel.setYangshi(28);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               if(this.equip.id == SpecialGoodsID.AOJIANWUSHUANGXUNZHANG)
               {
                  this.easyStonePanel.setYangshi(10);
                  this.easyStonePanel.setFengKuang(1);
                  this.isCaidanXiangqian = true;
               }
               else if(SpecialGoodsID.XUANYUANTIAN_ID.indexOf(this.equip.id) != -1)
               {
                  this.easyStonePanel.setYangshi(17);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               else if(SpecialGoodsID.XUANYUANDI_ID.indexOf(this.equip.id) != -1)
               {
                  this.easyStonePanel.setYangshi(18);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               else if(SpecialGoodsID.XUANYUANREN_ID.indexOf(this.equip.id) != -1)
               {
                  this.easyStonePanel.setYangshi(19);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               else if(SpecialGoodsID.AOJIAN_ID.indexOf(this.equip.id) != -1)
               {
                  if(this.equip.id != SpecialGoodsID.TIANFAAOJIAN)
                  {
                     this.easyStonePanel.setYangshi(20);
                     this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                     this.isCaidanXiangqian = true;
                  }
               }
               else if(this.equip.id == SpecialGoodsID.SHENGJI_SHENGDAN_XUNZHANG)
               {
                  this.easyStonePanel.setYangshi(114);
                  this.easyStonePanel.setFengKuang(5);
                  this.isCaidanXiangqian = true;
               }
               else if(this.equip.id == SpecialGoodsID.YN2015YUANDAN)
               {
                  this.easyStonePanel.setYangshi(115);
                  this.easyStonePanel.setFengKuang(5);
                  this.isCaidanXiangqian = true;
               }
               else if(this.equip.id == SpecialGoodsID.YN_TONGGU)
               {
                  this.easyStonePanel.setYangshi(116);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               else if(this.equip.id == SpecialGoodsID.YN_BAILONGJIANGSHI)
               {
                  this.easyStonePanel.setYangshi(117);
                  this.easyStonePanel.setFengKuang(6 - OtherConst.xunzhang_dakong);
                  this.isCaidanXiangqian = true;
               }
               else if(this.equip.id == SpecialGoodsID.YNZHONGJIEZHE)
               {
                  this.easyStonePanel.setYangshi(118);
                  this.easyStonePanel.setFengKuang(5);
                  this.isCaidanXiangqian = true;
               }
               else if(SpecialGoodsID.YNYITIANJIAN.indexOf(this.equip.id) != -1)
               {
                  this.easyStonePanel.setYangshi(119);
                  this.easyStonePanel.setFengKuang(1);
                  this.isCaidanXiangqian = true;
               }
               else if(this.tempType == 121)
               {
                  this.easyStonePanel.setYangshi(121);
                  this.easyStonePanel.setFengKuang(1);
                  this.isCaidanXiangqian = true;
               }
               this.easyStonePanel.setItem(_loc3_);
               this.isPanelUse = true;
         }
      }
      
      public function upDataItem(param1:*, param2:int, param3:* = null, param4:int = 11) : void
      {
         if(param2 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param2 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         if(!Fun.isVisible(this.easyStonePanel))
         {
            return;
         }
         this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.equip.position);
         this.send50125(this.equip,param4);
      }
      
      public function upDataItem_caidan_xiangqian(param1:String, param2:int, param3:* = null) : void
      {
         if(param2 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param2 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         if(!Fun.isVisible(this.easyStonePanel))
         {
            return;
         }
         this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.equip.position);
         this.send50125_caidan_xiangqian(this.equip);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(StoneOptionSmallPanel,function():void
         {
            easyStonePanel.addEventListener(StoneOptionSmallPanel.UI_STONE_OPTION_PANEL_STONE_CLICK,easyStonePanelHandle);
            easyStonePanel.addEventListener(StoneOptionSmallPanel.UI_STONE_OPTION_PANEL_DRAG_ENTER,easyStonePanelHandle);
            easyStonePanel.addEventListener(FCloseEvent.CLOSE,easyStonePanelClose);
            easyStonePanel.addEventListener(Event.REMOVED_FROM_STAGE,easyStonePanelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(StoneOptionSmallPanel,function():void
         {
            easyStonePanel.removeEventListener(StoneOptionSmallPanel.UI_STONE_OPTION_PANEL_STONE_CLICK,easyStonePanelHandle);
            easyStonePanel.removeEventListener(StoneOptionSmallPanel.UI_STONE_OPTION_PANEL_DRAG_ENTER,easyStonePanelHandle);
            easyStonePanel.removeEventListener(FCloseEvent.CLOSE,easyStonePanelClose);
            easyStonePanel.removeEventListener(Event.REMOVED_FROM_STAGE,easyStonePanelClose);
         });
      }
      
      private function easyStonePanelClose(param1:* = null) : void
      {
         this.equip = null;
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         ResizeManager.hideDoublePanel();
      }
      
      private function easyStonePanelHandle(param1:Event) : void
      {
         var baseE:BaseEvent = null;
         var arr:Array = null;
         var stoneIndexID:int = 0;
         var e:Event = param1;
         baseE = e as BaseEvent;
         var data:Object = {};
         switch(e.type)
         {
            case Event.ADDED_TO_STAGE:
               this.openBackpack();
               break;
            case StoneOptionSmallPanel.UI_STONE_OPTION_PANEL_STONE_CLICK:
               if(!this.isPanelUse)
               {
                  return;
               }
               arr = baseE.data as Array;
               stoneIndexID = arr[0] as int;
               if(this.isCaidanXiangqian)
               {
                  this.send50197(this.equip,stoneIndexID,arr[1] as int == 0 ? 11 : arr[1] as int);
               }
               this.isPanelUse = true;
               break;
            case StoneOptionSmallPanel.UI_STONE_OPTION_PANEL_DRAG_ENTER:
               if(!this.isPanelUse)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该物品不能镶嵌"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该物品不能镶嵌"),false);
                  return;
               }
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.stone = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  if(this.stone.res.kind != GoodsKind.K6)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该物品不是宝石"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该物品不是宝石"),false);
                     return;
                  }
                  if(this.equip.bind == 0)
                  {
                     FAlert.okLabel = LanResManager.getLanCommonTextWords("镶嵌");
                     FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                     FAlert.show(LanResManager.getLanTextWords(this,"绑定提示",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           if(isCaidanXiangqian)
                           {
                              send50195(equip,stone,baseE.data as int == 0 ? 11 : baseE.data as int);
                           }
                           else
                           {
                              send50195_caidan_xiangqian(equip,stone,baseE.data as int == 0 ? 22 : baseE.data as int);
                           }
                        }
                     });
                  }
                  else if(this.isCaidanXiangqian)
                  {
                     this.send50195(this.equip,this.stone,baseE.data as int == 0 ? 11 : baseE.data as int);
                  }
                  else
                  {
                     this.send50195_caidan_xiangqian(this.equip,this.stone,baseE.data as int == 0 ? 22 : baseE.data as int);
                  }
                  break;
               }
               return;
         }
      }
      
      private function send50197(param1:Goods, param2:int, param3:int = 11) : void
      {
         var _loc4_:Object = {};
         _loc4_.equipXY = param1.position;
         _loc4_.equipID = param1.id;
         _loc4_.useYuZao = false;
         _loc4_.xingYunJingNum = 0;
         _loc4_.stoneID = param2;
         _loc4_.type = param3;
         this.sendMsg.send_50197(_loc4_);
      }
      
      private function send50195(param1:Goods, param2:Goods, param3:int = 11) : void
      {
         var _loc4_:Object = {};
         _loc4_.equipXY = param1.position;
         _loc4_.equipID = param1.id;
         _loc4_.stoneXY = param2.position;
         _loc4_.stoneID = param2.id;
         _loc4_.xingYunJingNum = 0;
         _loc4_.type = param3;
         this.sendMsg.send_50195(_loc4_);
      }
      
      private function send50125(param1:Goods, param2:int = 11) : void
      {
         this.isPanelUse = false;
         var _loc3_:Object = {};
         _loc3_.XY = param1.position;
         _loc3_.ID = param1.id;
         _loc3_.type = param2;
         this.sendMsg.send_50125(_loc3_);
      }
      
      private function send50125_caidan_xiangqian(param1:Goods, param2:int = 22) : void
      {
         this.isPanelUse = false;
         var _loc3_:Object = {};
         _loc3_.XY = param1.position;
         _loc3_.ID = param1.id;
         _loc3_.type = param2;
         this.sendMsg.send_50125(_loc3_);
      }
      
      private function send50195_caidan_xiangqian(param1:Goods, param2:Goods, param3:int = 22) : void
      {
         var _loc4_:Object = {};
         _loc4_.equipXY = param1.position;
         _loc4_.equipID = param1.id;
         _loc4_.stoneXY = param2.position;
         _loc4_.stoneID = param2.id;
         _loc4_.xingYunJingNum = 0;
         _loc4_.type = param3;
         this.sendMsg.send_50195(_loc4_);
      }
      
      private function send50197_caidan_xiangqian(param1:Goods, param2:int, param3:int = 22) : void
      {
         var _loc4_:Object = {};
         _loc4_.equipXY = param1.position;
         _loc4_.equipID = param1.id;
         _loc4_.useYuZao = false;
         _loc4_.xingYunJingNum = 0;
         _loc4_.stoneID = param2;
         _loc4_.type = param3;
         this.sendMsg.send_50197(_loc4_);
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.easyStonePanel,GameInstance.uiInstance.backpack);
      }
      
      private function get sendMsg() : Stone_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Stone_MsgSendProxy.NAME) as Stone_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

