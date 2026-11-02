package com.tgame.moudels.amulet.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.amulet.Amulet_ApplicationFacade;
   import com.tgame.moudels.amulet.model.Amult_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.ShenlongDakongPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShenLongHuShenFuDaKong_Mediator extends Mediator
   {
      
      public static const NAME:String = "ShenLongHuShenFuDaKong_Mediator";
      
      private var item:Goods;
      
      private var dakongId:int;
      
      private var _sender:Amult_MsgSenderProxy;
      
      public function ShenLongHuShenFuDaKong_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get sender() : Amult_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Amult_MsgSenderProxy.NAME) as Amult_MsgSenderProxy;
         }
         return this._sender;
      }
      
      protected function get panel() : ShenlongDakongPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shenLongDaKongPanel);
         }
         return viewComponent as ShenlongDakongPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Amulet_ApplicationFacade.GOODS_CHANGE,Amulet_ApplicationFacade.SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Amulet_ApplicationFacade.GOODS_CHANGE:
               if(!Fun.isVisible(GameInstance.uiInstance._shenLongDaKongPanel) || !this.item)
               {
                  return;
               }
               _loc3_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.item.position);
               if(_loc3_ != this.item)
               {
                  this.quChu();
               }
               break;
            case Amulet_ApplicationFacade.SHOW_SHEN_LONG_HU_SHEN_FU_DA_KONG:
               this.dakongId = _loc2_ as int;
               this.openBackpack();
         }
      }
      
      public function setChangeItem(param1:int, param2:int, param3:int) : void
      {
         if(param3 == this.dakongId)
         {
            if(!this.item)
            {
               return;
            }
            if(GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1) != this.item)
            {
               return;
            }
            this.panel.setGoods1(this.item);
            this.panel.setGoods2(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true,true));
            this.panel.setNum(param2);
            if(this.dakongId == SpecialGoodsID.SHENLONGDAKONGSHI)
            {
               this.panel.setShenglong();
               return;
            }
            if(this.dakongId == SpecialGoodsID.PUTONG_DAKONGSHI || this.dakongId == SpecialGoodsID.JINGLIAN_DAKONGSHI || this.dakongId == SpecialGoodsID.KUAPINGTAI_DAKONGSHI)
            {
               this.panel.setXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUNDUNXUNZHANG_DAKONGSHI)
            {
               this.panel.setHundunXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.KUNSHOUZHIDOUXUNZHANG_DAKONGSHI)
            {
               this.panel.setKunShouZhiDouXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SUDUZHIXINGXUNZHANG_DAKONGSHI)
            {
               this.panel.setSuDuZhiXingXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YUMOZHANSHI_QIANGHUASHI)
            {
               this.panel.setYuMoXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WUXIANGSHENGONGXUNZHANG_DAKONGSHI)
            {
               this.panel.setWuXiangShenGongXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WANJIAN_DAKONGSHI)
            {
               this.panel.setWanJianXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BIWUBAZHUXUNZHANG_DAKONGSHI)
            {
               this.panel.setBazhuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BIWUBAZHUXUNZHANG_16_DAKONGSHI)
            {
               this.panel.setKuapingtaiBazhuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUETIANMOGONGXUNZHANG_DAKONGSHI)
            {
               this.panel.setXueTianMoGongXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MENGHUANBAZHU_DAKONGSHI)
            {
               this.panel.setMengHuanBaZhuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BEIDOUXINGCHEN_DAKONGSHI)
            {
               this.panel.setBeiDouXingChenXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUMOSHENJIA_DAKONGSHI)
            {
               this.panel.setHuMoShenJiaXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YUANSHENYUJIAN_DAKONGSHI)
            {
               this.panel.setYuanShenYuJianXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.DAGOUBANG_DAKONGSHI)
            {
               this.panel.setDaGouBang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SHENDAOYINXUE_DAKONGSHI)
            {
               this.panel.setShenDaoXueYin();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINXUEYIN_DAKONGSHI)
            {
               this.panel.setHuangJinXueYin();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TIANSHANG_DAKONGSHI)
            {
               this.panel.setWuHunTianShang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.QINGLONGYANYUE_DAKONGSHI)
            {
               this.panel.setQingLongYanYue();
               return;
            }
            if(this.dakongId == SpecialGoodsID.POJUNCANGLONG_DAKONGSHI)
            {
               this.panel.setPoJunCangLong();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINKAITIANFU_DAKONGSHI)
            {
               this.panel.setHuangJinKaiTianFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINXINGTIAN_DAKONGSHI)
            {
               this.panel.setHuangJinXingTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JIHUOHUANGZHEN_DAKONGSHI)
            {
               this.panel.setJiHuoHuangZhenXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LANYUPANLONGGUN_DAKONGSHI)
            {
               this.panel.setLanYuPanLongGun();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YUANYUEWANDAO_DAKONGSHI)
            {
               this.panel.setYuanYueWanDao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WUXINGSHENLONG_DAKONGSHI)
            {
               this.panel.setWuXingShenLongXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JIDAOQIANKUN_DAKONGSHI)
            {
               this.panel.setJiDaoQianKunXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.ZIWUQIXING_DAKONGSHI)
            {
               this.panel.setZiWuQiXing();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TULONGMOYING_DAKONGSHI)
            {
               this.panel.setTuLongMoYing();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LUTUWANREN_DAKONGSHI)
            {
               this.panel.setLuTuWanRen();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LIETIANBAWANGJI_DAKONGSHI)
            {
               this.panel.setLieTianBaWangJi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.POXIAOLANYUE_DAKONGSHI)
            {
               this.panel.setPoXiaoLanYue();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUNDUNYOULONGQIANG_DAKONGSHI)
            {
               this.panel.setHunDunYouLongQiang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LUOHANFUTIXUNZHANG_DAKONGSHI)
            {
               this.panel.setLuoHanFuTiXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YINGXIONGHUFU_DAKONGSHI)
            {
               this.panel.setYingXiongHuFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.ZHUXIAN_DAKONGSHI)
            {
               this.panel.setZhuXian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINJIAN_DAKONGSHI)
            {
               this.panel.setHuangJinJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HONGLIAN_DAKONGSHI)
            {
               this.panel.setHongLian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.CHIYAN_DAKONGSHI)
            {
               this.panel.setChiYan();
               return;
            }
            if(this.dakongId == SpecialGoodsID.POTIAN_DAKONGSHI)
            {
               this.panel.setPoTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.ZIYINGJIAN_DAKONGSHI)
            {
               this.panel.setZiYingJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HONGMO_DAKONGSHI)
            {
               this.panel.setHongMo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGTUBAYEHUANGSHI_DAKONGSHI)
            {
               this.panel.setHuangTuBaYeHuangShi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YANTIAN_DAKONGSHI)
            {
               this.panel.setYanTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.PANGUKAITIANFU_DAKONGSHI)
            {
               this.panel.setPanGuKaiTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.NIYAN_DAKONGSHI)
            {
               this.panel.setNiYan();
               return;
            }
            if(this.dakongId == SpecialGoodsID.CHUANGSHI_DAKONGSHI)
            {
               this.panel.setChuangShi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUANYUANSHENJIAN_DAKONGSHI)
            {
               this.panel.setXuanYuanShenJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LIANYAOHU_DAKONGSHI)
            {
               this.panel.setLianYaoHu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.CHIXIAO_DAKONGSHI)
            {
               this.panel.setChiXiao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LONGWANGSANCHAJI_DAKONGSHI)
            {
               this.panel.setLongWangSanChaJi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MOJIAN_DAKONGSHI)
            {
               this.panel.setMoJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JIUYUEXUNZHANG_DAKONGSHI)
            {
               this.panel.setJiuYueXinShiDai();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BINGJINGCHUI_DAKONGSHI)
            {
               this.panel.setBingJingChui();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUOYUN_DAKONGSHI)
            {
               this.panel.setHuoYun();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MODAO_DAKONGSHI)
            {
               this.panel.setMoDao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YUANJIANLINGPO_DAKONGSHI)
            {
               this.panel.setYuanJianLingPo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BAJIAOSHAN_DAKONGSHI)
            {
               this.panel.setBaJiaoShan();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XIALVTUMO_DAKONGSHI)
            {
               this.panel.setXiaLvTuMo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.FENGLEI_DAKONGSHI)
            {
               this.panel.setFengLei();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LIUXINGLUO_DAKONGSHI)
            {
               this.panel.setLiuXingLuo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XIELONGMOJIAN_DAKONGSHI)
            {
               this.panel.setXieLongMoJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUEWU_DAKONGSHI)
            {
               this.panel.setXueWu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JULONGZHIJI_DAKONGSHI)
            {
               this.panel.setJuLongZhiJi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HANGUANG_DAKONGSHI)
            {
               this.panel.setHanGuang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TAOWUNEIDAN_DAKONGSHI)
            {
               this.panel.setTaoWuNeiDan();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SUIHUNYINXUE_DAKONGSHI)
            {
               this.panel.setSuiHunYinXue();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SHENMO_DAKONGSHI)
            {
               this.panel.setShenMo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XIANGYANSHUAIYIN_DAKONGSHI)
            {
               this.panel.setXiangYangShuaiYin();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JUNQI_DAKONGSHI)
            {
               this.panel.setJunQi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.FUMOZHANGFA_TIANLONG_DAKONGSHI)
            {
               this.panel.setTianLong();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MINGJIAOHUSHENFU_DAKONGSHI)
            {
               this.panel.setMingJiaoHuShenFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LIHUAQIANG_DAKONGSHI)
            {
               this.panel.setLiHuaQiang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SHENBINGFU_DAKONGSHI)
            {
               this.panel.setShenBingFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TIANJING_DAKONGSHI)
            {
               this.panel.setTianJing();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TULONGDAO_DAKONGSHI)
            {
               this.panel.setTuLongDao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LUOSHENJIAN_DAKONGSHI)
            {
               this.panel.setLuoShenJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TIANZHU_DAKONGSHI)
            {
               this.panel.setTianZhu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.DUANHUN_DAKONGSHI)
            {
               this.panel.setDuanHun();
               return;
            }
            if(this.dakongId == SpecialGoodsID.FENGLEIHUSHENFU_DAKONGSHI)
            {
               this.panel.setFengLeiHuShenFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LONGZHUXUNZHANG_DAKONGSHI)
            {
               this.panel.setLongZhuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.DAOGUXIANFENG_DAKONGSHI)
            {
               this.panel.setDaoGuXianFeng();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SHISHEN_DAKONGSHI)
            {
               this.panel.setShiShen();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WUYINGJIAN_DAKONGSHI)
            {
               this.panel.setWuYingJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MINGHONGDAO_DAKONGSHI)
            {
               this.panel.setMingHongDao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JINGU_DAKONGSHI)
            {
               this.panel.setJinGu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUTAOZHENHUNXUNZHANG_DAKONGSHI1)
            {
               this.panel.setHuTaoZhenHun1();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUTAOZHENHUNXUNZHANG_DAKONGSHI2)
            {
               this.panel.setHuTaoZhenHun1();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUTAOZHENHUNXUNZHANG_DAKONGSHI3)
            {
               this.panel.setHuTaoZhenHun1();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUTAOZHENHUNXUNZHANG_DAKONGSHI4)
            {
               this.panel.setHuTaoZhenHun1();
               return;
            }
            if(this.dakongId == SpecialGoodsID.QIYUEBAZHUXUNZHANG_DAKONGSHI)
            {
               this.panel.setQiYueBaZhu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.QIYUEBAZHUXUNZHANG_CHUANCHENG_DAKONGSHI)
            {
               this.panel.setQiYueBaZhu_ChuanCheng();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGQUANBAZHUXUNZHANG_DAKONGSHI)
            {
               this.panel.setHuangQuanBaZhu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JIETIAN_DAKONGSHI)
            {
               this.panel.setJieTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TIANFAAOJIAN_DAKONGSHI)
            {
               this.panel.setTianFaAoJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUESHAGUXING_DAKONGSHI)
            {
               this.panel.setXueShaGuXing();
               return;
            }
            if(this.dakongId == SpecialGoodsID.ZIJINGZHONGJIAN_DAKONGSHI)
            {
               this.panel.setZiJingZhongJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINYANYUE_DAKONGSHI)
            {
               this.panel.setHuangJinYanYue();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUANTIEZHONGJIAN_DAKONGSHI)
            {
               this.panel.setXuanTieZhongJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.QUANSHEN_DAKONGSHI)
            {
               this.panel.setShenBingQuanShen();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JINLONGPANGU_DAKONGSHI)
            {
               this.panel.setJinLongPanGu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SIWANGSHALOU_DAKONGSHI)
            {
               this.panel.setSiWangShaLouXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WULEIHUAJI_DAKONGSHI)
            {
               this.panel.setWuLeiHuaJiXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YURENJIE_DAKONGSHI)
            {
               this.panel.setYuRenJieXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YN_TONGGU_DAKONGSHI)
            {
               this.panel.setYNTongGuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YN_BAILONGJIANGSHI_DAKONGSHI)
            {
               this.panel.setYNBaiLongJiangShiXunZhang();
               return;
            }
            this.panel.setShenbing(GoodsResManager.getGoodsRes(this.dakongId).desc);
         }
         else if(this.dakongId == SpecialGoodsID.SHENLONGDAKONGSHI)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入神龙护身符！"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入神龙护身符！"),false);
         }
         else if(Boolean(this.dakongId == SpecialGoodsID.PUTONG_DAKONGSHI || this.dakongId == SpecialGoodsID.JINGLIAN_DAKONGSHI) || Boolean(SpecialGoodsID.KUAPINGTAI_DAKONGSHI) || Boolean(SpecialGoodsID.YUMOZHANSHI_QIANGHUASHI))
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入勋章！"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入勋章！"),false);
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入跟") + GoodsResManager.getGoodsRes(this.dakongId).name + LanResManager.getLanCommonTextWords("相符合的神兵！"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入跟") + GoodsResManager.getGoodsRes(this.dakongId).name + LanResManager.getLanCommonTextWords("相符合的神兵！"),false);
         }
      }
      
      public function itemChangeComplete(param1:int, param2:int) : void
      {
         this.item = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1);
         this.panel.setGoods1(this.item);
         if(param2)
         {
            this.panel.setGoods2(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2,true,true));
         }
         this.sender.send_52125([this.item.position,param2]);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShenlongDakongPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.addEventListener(ShenlongDakongPanel.UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK,panelHandle);
            panel.addEventListener(ShenlongDakongPanel.UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER,panelHandle);
            panel.addEventListener(ShenlongDakongPanel.UI_SHENLONGDAKONG_OK_CLICK,panelHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShenlongDakongPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.removeEventListener(ShenlongDakongPanel.UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK,panelHandle);
            panel.removeEventListener(ShenlongDakongPanel.UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER,panelHandle);
            panel.removeEventListener(ShenlongDakongPanel.UI_SHENLONGDAKONG_OK_CLICK,panelHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null) : void
      {
         this.panel.setNull();
         ResizeManager.hideDoublePanel();
         this.item = null;
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case ShenlongDakongPanel.UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK:
               this.quChu();
               break;
            case ShenlongDakongPanel.UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.item = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.sender.send_52125([this.item.position,this.dakongId]);
               }
               break;
            case ShenlongDakongPanel.UI_SHENLONGDAKONG_OK_CLICK:
               if(!this.item)
               {
                  return;
               }
               this.sender.send_52127([this.item.position,this.dakongId]);
         }
      }
      
      private function quChu() : void
      {
         this.item = null;
         this.panel.setNull();
         this.panel.setGoods1();
      }
      
      private function openBackpack() : void
      {
         this.quChu();
         if(this.dakongId != 0)
         {
            this.panel.setGoods2(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.dakongId,true,true));
            if(!Fun.isVisible(GameInstance.uiInstance._backpack))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
            }
            ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
            if(this.dakongId == SpecialGoodsID.SHENLONGDAKONGSHI)
            {
               this.panel.setShenglong();
               return;
            }
            if(this.dakongId == SpecialGoodsID.PUTONG_DAKONGSHI || this.dakongId == SpecialGoodsID.JINGLIAN_DAKONGSHI || this.dakongId == SpecialGoodsID.KUAPINGTAI_DAKONGSHI)
            {
               this.panel.setXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUNDUNXUNZHANG_DAKONGSHI)
            {
               this.panel.setHundunXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.KUNSHOUZHIDOUXUNZHANG_DAKONGSHI)
            {
               this.panel.setKunShouZhiDouXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SUDUZHIXINGXUNZHANG_DAKONGSHI)
            {
               this.panel.setSuDuZhiXingXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YUMOZHANSHI_QIANGHUASHI)
            {
               this.panel.setYuMoXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WUXIANGSHENGONGXUNZHANG_DAKONGSHI)
            {
               this.panel.setWuXiangShenGongXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WANJIAN_DAKONGSHI)
            {
               this.panel.setWanJianXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BIWUBAZHUXUNZHANG_DAKONGSHI)
            {
               this.panel.setBazhuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BIWUBAZHUXUNZHANG_16_DAKONGSHI)
            {
               this.panel.setKuapingtaiBazhuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUETIANMOGONGXUNZHANG_DAKONGSHI)
            {
               this.panel.setXueTianMoGongXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MENGHUANBAZHU_DAKONGSHI)
            {
               this.panel.setMengHuanBaZhuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BEIDOUXINGCHEN_DAKONGSHI)
            {
               this.panel.setBeiDouXingChenXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUMOSHENJIA_DAKONGSHI)
            {
               this.panel.setHuMoShenJiaXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YUANSHENYUJIAN_DAKONGSHI)
            {
               this.panel.setYuanShenYuJianXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.DAGOUBANG_DAKONGSHI)
            {
               this.panel.setDaGouBang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SHENDAOYINXUE_DAKONGSHI)
            {
               this.panel.setShenDaoXueYin();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINXUEYIN_DAKONGSHI)
            {
               this.panel.setHuangJinXueYin();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TIANSHANG_DAKONGSHI)
            {
               this.panel.setWuHunTianShang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.QINGLONGYANYUE_DAKONGSHI)
            {
               this.panel.setQingLongYanYue();
               return;
            }
            if(this.dakongId == SpecialGoodsID.POJUNCANGLONG_DAKONGSHI)
            {
               this.panel.setPoJunCangLong();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINKAITIANFU_DAKONGSHI)
            {
               this.panel.setHuangJinKaiTianFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINXINGTIAN_DAKONGSHI)
            {
               this.panel.setHuangJinXingTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JIHUOHUANGZHEN_DAKONGSHI)
            {
               this.panel.setJiHuoHuangZhenXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LANYUPANLONGGUN_DAKONGSHI)
            {
               this.panel.setLanYuPanLongGun();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YUANYUEWANDAO_DAKONGSHI)
            {
               this.panel.setYuanYueWanDao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WUXINGSHENLONG_DAKONGSHI)
            {
               this.panel.setWuXingShenLongXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JIDAOQIANKUN_DAKONGSHI)
            {
               this.panel.setJiDaoQianKunXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.ZIWUQIXING_DAKONGSHI)
            {
               this.panel.setZiWuQiXing();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TULONGMOYING_DAKONGSHI)
            {
               this.panel.setTuLongMoYing();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LUTUWANREN_DAKONGSHI)
            {
               this.panel.setLuTuWanRen();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LIETIANBAWANGJI_DAKONGSHI)
            {
               this.panel.setLieTianBaWangJi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.POXIAOLANYUE_DAKONGSHI)
            {
               this.panel.setPoXiaoLanYue();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUNDUNYOULONGQIANG_DAKONGSHI)
            {
               this.panel.setHunDunYouLongQiang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LUOHANFUTIXUNZHANG_DAKONGSHI)
            {
               this.panel.setLuoHanFuTiXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YINGXIONGHUFU_DAKONGSHI)
            {
               this.panel.setYingXiongHuFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.ZHUXIAN_DAKONGSHI)
            {
               this.panel.setZhuXian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINJIAN_DAKONGSHI)
            {
               this.panel.setHuangJinJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HONGLIAN_DAKONGSHI)
            {
               this.panel.setHongLian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.CHIYAN_DAKONGSHI)
            {
               this.panel.setChiYan();
               return;
            }
            if(this.dakongId == SpecialGoodsID.POTIAN_DAKONGSHI)
            {
               this.panel.setPoTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.ZIYINGJIAN_DAKONGSHI)
            {
               this.panel.setZiYingJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HONGMO_DAKONGSHI)
            {
               this.panel.setHongMo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGTUBAYEHUANGSHI_DAKONGSHI)
            {
               this.panel.setHuangTuBaYeHuangShi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YANTIAN_DAKONGSHI)
            {
               this.panel.setYanTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.PANGUKAITIANFU_DAKONGSHI)
            {
               this.panel.setPanGuKaiTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.NIYAN_DAKONGSHI)
            {
               this.panel.setNiYan();
               return;
            }
            if(this.dakongId == SpecialGoodsID.CHUANGSHI_DAKONGSHI)
            {
               this.panel.setChuangShi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUANYUANSHENJIAN_DAKONGSHI)
            {
               this.panel.setXuanYuanShenJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LIANYAOHU_DAKONGSHI)
            {
               this.panel.setLianYaoHu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.CHIXIAO_DAKONGSHI)
            {
               this.panel.setChiXiao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LONGWANGSANCHAJI_DAKONGSHI)
            {
               this.panel.setLongWangSanChaJi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MOJIAN_DAKONGSHI)
            {
               this.panel.setMoJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JIUYUEXUNZHANG_DAKONGSHI)
            {
               this.panel.setJiuYueXinShiDai();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BINGJINGCHUI_DAKONGSHI)
            {
               this.panel.setBingJingChui();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUOYUN_DAKONGSHI)
            {
               this.panel.setHuoYun();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MODAO_DAKONGSHI)
            {
               this.panel.setMoDao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YUANJIANLINGPO_DAKONGSHI)
            {
               this.panel.setYuanJianLingPo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.BAJIAOSHAN_DAKONGSHI)
            {
               this.panel.setBaJiaoShan();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XIALVTUMO_DAKONGSHI)
            {
               this.panel.setXiaLvTuMo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.FENGLEI_DAKONGSHI)
            {
               this.panel.setFengLei();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LIUXINGLUO_DAKONGSHI)
            {
               this.panel.setLiuXingLuo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XIELONGMOJIAN_DAKONGSHI)
            {
               this.panel.setXieLongMoJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUEWU_DAKONGSHI)
            {
               this.panel.setXueWu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JULONGZHIJI_DAKONGSHI)
            {
               this.panel.setJuLongZhiJi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HANGUANG_DAKONGSHI)
            {
               this.panel.setHanGuang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TAOWUNEIDAN_DAKONGSHI)
            {
               this.panel.setTaoWuNeiDan();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SUIHUNYINXUE_DAKONGSHI)
            {
               this.panel.setSuiHunYinXue();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SHENMO_DAKONGSHI)
            {
               this.panel.setShenMo();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XIANGYANSHUAIYIN_DAKONGSHI)
            {
               this.panel.setXiangYangShuaiYin();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JUNQI_DAKONGSHI)
            {
               this.panel.setJunQi();
               return;
            }
            if(this.dakongId == SpecialGoodsID.FUMOZHANGFA_TIANLONG_DAKONGSHI)
            {
               this.panel.setTianLong();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MINGJIAOHUSHENFU_DAKONGSHI)
            {
               this.panel.setMingJiaoHuShenFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LIHUAQIANG_DAKONGSHI)
            {
               this.panel.setLiHuaQiang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SHENBINGFU_DAKONGSHI)
            {
               this.panel.setShenBingFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TIANJING_DAKONGSHI)
            {
               this.panel.setTianJing();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TULONGDAO_DAKONGSHI)
            {
               this.panel.setTuLongDao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LUOSHENJIAN_DAKONGSHI)
            {
               this.panel.setLuoShenJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TIANZHU_DAKONGSHI)
            {
               this.panel.setTianZhu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.DUANHUN_DAKONGSHI)
            {
               this.panel.setDuanHun();
               return;
            }
            if(this.dakongId == SpecialGoodsID.FENGLEIHUSHENFU_DAKONGSHI)
            {
               this.panel.setFengLeiHuShenFu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.LONGZHUXUNZHANG_DAKONGSHI)
            {
               this.panel.setLongZhuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.DAOGUXIANFENG_DAKONGSHI)
            {
               this.panel.setDaoGuXianFeng();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SHISHEN_DAKONGSHI)
            {
               this.panel.setShiShen();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WUYINGJIAN_DAKONGSHI)
            {
               this.panel.setWuYingJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.MINGHONGDAO_DAKONGSHI)
            {
               this.panel.setMingHongDao();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JINGU_DAKONGSHI)
            {
               this.panel.setJinGu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUTAOZHENHUNXUNZHANG_DAKONGSHI1)
            {
               this.panel.setHuTaoZhenHun1();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUTAOZHENHUNXUNZHANG_DAKONGSHI2)
            {
               this.panel.setHuTaoZhenHun1();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUTAOZHENHUNXUNZHANG_DAKONGSHI3)
            {
               this.panel.setHuTaoZhenHun1();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUTAOZHENHUNXUNZHANG_DAKONGSHI4)
            {
               this.panel.setHuTaoZhenHun1();
               return;
            }
            if(this.dakongId == SpecialGoodsID.QIYUEBAZHUXUNZHANG_DAKONGSHI)
            {
               this.panel.setQiYueBaZhu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.QIYUEBAZHUXUNZHANG_CHUANCHENG_DAKONGSHI)
            {
               this.panel.setQiYueBaZhu_ChuanCheng();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGQUANBAZHUXUNZHANG_DAKONGSHI)
            {
               this.panel.setHuangQuanBaZhu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JIETIAN_DAKONGSHI)
            {
               this.panel.setJieTian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.TIANFAAOJIAN_DAKONGSHI)
            {
               this.panel.setTianFaAoJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUESHAGUXING_DAKONGSHI)
            {
               this.panel.setXueShaGuXing();
               return;
            }
            if(this.dakongId == SpecialGoodsID.ZIJINGZHONGJIAN_DAKONGSHI)
            {
               this.panel.setZiJingZhongJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.HUANGJINYANYUE_DAKONGSHI)
            {
               this.panel.setHuangJinYanYue();
               return;
            }
            if(this.dakongId == SpecialGoodsID.XUANTIEZHONGJIAN_DAKONGSHI)
            {
               this.panel.setXuanTieZhongJian();
               return;
            }
            if(this.dakongId == SpecialGoodsID.QUANSHEN_DAKONGSHI)
            {
               this.panel.setShenBingQuanShen();
               return;
            }
            if(this.dakongId == SpecialGoodsID.JINLONGPANGU_DAKONGSHI)
            {
               this.panel.setJinLongPanGu();
               return;
            }
            if(this.dakongId == SpecialGoodsID.SIWANGSHALOU_DAKONGSHI)
            {
               this.panel.setSiWangShaLouXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.WULEIHUAJI_DAKONGSHI)
            {
               this.panel.setWuLeiHuaJiXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YURENJIE_DAKONGSHI)
            {
               this.panel.setYuRenJieXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YN_TONGGU_DAKONGSHI)
            {
               this.panel.setYNTongGuXunZhang();
               return;
            }
            if(this.dakongId == SpecialGoodsID.YN_BAILONGJIANGSHI_DAKONGSHI)
            {
               this.panel.setYNBaiLongJiangShiXunZhang();
               return;
            }
            this.panel.setShenbing(GoodsResManager.getGoodsRes(this.dakongId).desc);
         }
      }
   }
}

