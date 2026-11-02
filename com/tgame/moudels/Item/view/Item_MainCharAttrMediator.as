package com.tgame.moudels.Item.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_ItemProxy;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.Backpack;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_MainCharAttrMediator extends Mediator
   {
      
      public static const NAME:String = "Item_MainCharAttrMediator";
      
      private var itemMenu:Menu;
      
      private var _backPackMediator:Item_BackpackMediator;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _itemProxy:Item_ItemProxy;
      
      public function Item_MainCharAttrMediator()
      {
         super(NAME);
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
      
      public function get itemProxy() : Item_ItemProxy
      {
         if(this._itemProxy == null)
         {
            this._itemProxy = facade.retrieveProxy(Item_ItemProxy.NAME) as Item_ItemProxy;
         }
         return this._itemProxy;
      }
      
      protected function get attrPanel() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      protected function get backPackMediator() : Item_BackpackMediator
      {
         if(this._backPackMediator == null)
         {
            this._backPackMediator = facade.retrieveMediator(Item_BackpackMediator.NAME) as Item_BackpackMediator;
         }
         return this._backPackMediator;
      }
      
      protected function get backpack() : Backpack
      {
         return GameInstance.uiInstance.backpack;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.EQUIP_QIANGHUA_SUCCESS,Item_ApplicationFacade.UPDATE_MAINCHAR_YUPEI,Item_ApplicationFacade.UI_CHAR_ATTRIBUTE_MENU_SHOW,Item_ApplicationFacade.SAVE_SHOW_JIAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var itemFace:ItemFace = null;
         var good:Goods = null;
         var note:INotification = param1;
         var noteBody:Object = note.getBody();
         switch(note.getName())
         {
            case Item_ApplicationFacade.EQUIP_QIANGHUA_SUCCESS:
               this.showBodyItem();
               break;
            case Item_ApplicationFacade.UPDATE_MAINCHAR_YUPEI:
               this.showBodyItem();
               break;
            case Item_ApplicationFacade.SAVE_SHOW_JIAN:
               this.sender.send_49993({
                  "id":noteBody.id,
                  "isReceived":0
               });
               break;
            case Item_ApplicationFacade.UI_CHAR_ATTRIBUTE_MENU_SHOW:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  itemFace = TCursorManager.currentItemFace;
                  good = itemFace.getBaseItem() as Goods;
                  if(good != null)
                  {
                     if(good.quality >= 4 && good.bind == 0)
                     {
                        FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):void
                        {
                           if(param1.eventData == FAlert.OK)
                           {
                              sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                           }
                        },true);
                     }
                     else
                     {
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                     }
                  }
               }
               else
               {
                  itemFace = noteBody.data.target as ItemFace;
                  if(itemFace != null)
                  {
                     if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
                     {
                        TCursorManager.setCurrentStatus(TCursorManager.CURSOR_MOREN);
                        TCursorManager.removeLockOnMouseStatus();
                        TCursorManager.resumMouse();
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,itemFace,itemFace.getBaseItem().position,ItemPositionRange.CONTAINER_BODY]);
                        TCursorManager.currentItemFace = null;
                     }
                     else
                     {
                        this.backPackMediator.showItemMenu([noteBody.data,itemFace.getBaseItem().position,1]);
                     }
                  }
                  else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
                  {
                     itemFace = TCursorManager.currentItemFace;
                     good = itemFace.getBaseItem() as Goods;
                     if(good.quality >= 4 && good.bind == 0)
                     {
                        FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):void
                        {
                           if(param1.eventData == FAlert.OK)
                           {
                              sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                              TCursorManager.resumFullMouse();
                           }
                        },true);
                     }
                     else
                     {
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                        TCursorManager.resumFullMouse();
                     }
                  }
               }
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
            attrPanel.addEventListener(Event.ADDED_TO_STAGE,uiHandle);
            attrPanel.addEventListener(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,uiHandle);
            attrPanel.addEventListener(CharAttribute.UI_CHAR_SELECT_SHOW_JIAN,uiHandle);
            attrPanel.addEventListener(CharAttribute.EQUIP_SEARCH_UNLOAD,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            attrPanel.removeEventListener(Event.ADDED_TO_STAGE,uiHandle);
            attrPanel.removeEventListener(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,uiHandle);
            attrPanel.removeEventListener(CharAttribute.UI_CHAR_SELECT_SHOW_JIAN,uiHandle);
            attrPanel.addEventListener(CharAttribute.EQUIP_SEARCH_UNLOAD,uiHandle);
         });
      }
      
      private function uiHandle(param1:*) : void
      {
         var itemFace:ItemFace = null;
         var good:Goods = null;
         var gid:int = 0;
         var goodsItem:Goods = null;
         var e:* = param1;
         var type:String = e.type;
         switch(type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case CharAttribute.UI_CHAR_SELECT_SHOW_JIAN:
               gid = e.data as int;
               this.sender.send_49993({
                  "id":gid,
                  "isReceived":1
               });
               break;
            case CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  itemFace = TCursorManager.currentItemFace;
                  good = itemFace.getBaseItem() as Goods;
                  if(good != null)
                  {
                     if(good.quality >= 4 && good.bind == 0)
                     {
                        FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):void
                        {
                           if(param1.eventData == FAlert.OK)
                           {
                              sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                           }
                        },true);
                     }
                     else
                     {
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                     }
                  }
               }
               else
               {
                  itemFace = e.data.target as ItemFace;
                  if(itemFace != null)
                  {
                     if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
                     {
                        TCursorManager.setCurrentStatus(TCursorManager.CURSOR_MOREN);
                        TCursorManager.removeLockOnMouseStatus();
                        TCursorManager.resumMouse();
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,itemFace,itemFace.getBaseItem().position,ItemPositionRange.CONTAINER_BODY]);
                        TCursorManager.currentItemFace = null;
                     }
                     else
                     {
                        this.backPackMediator.showItemMenu([e.data,itemFace.getBaseItem().position,1]);
                     }
                  }
                  else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
                  {
                     itemFace = TCursorManager.currentItemFace;
                     good = itemFace.getBaseItem() as Goods;
                     if(good.quality >= 4 && good.bind == 0)
                     {
                        FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):void
                        {
                           if(param1.eventData == FAlert.OK)
                           {
                              sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                              TCursorManager.resumFullMouse();
                           }
                        },true);
                     }
                     else
                     {
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,good.res.position,ItemPositionRange.CONTAINER_BODY]);
                        TCursorManager.resumFullMouse();
                     }
                  }
               }
               break;
            case CharAttribute.EQUIP_SEARCH_UNLOAD:
               goodsItem = e.data as Goods;
               this.sender.send_10075([goodsItem.position,0,0,goodsItem.res.position,ItemPositionRange.CONTAINER_BAG]);
         }
      }
      
      public function showBodyItem() : void
      {
         var bodyArr:Array = null;
         var booArr:Array = null;
         var goodID:int = 0;
         var k:int = 0;
         var m:int = 0;
         var j:int = 0;
         var n:int = 0;
         var siShengShouArr:Array = null;
         var goods:Goods = null;
         var wulizhiAr:Array = new Array();
         var zhanqiAr:Array = new Array();
         var CJTBSAr:Array = new Array();
         var TSJJAr:Array = new Array();
         var BGHLAr:Array = new Array();
         var XLSBZAr:Array = new Array();
         var SLZ_HDZBAr:Array = new Array();
         var ZhuXunzhangAr:Array = new Array();
         var anQiAr:Array = new Array();
         var bowArr:Array = new Array();
         var llzbArr:Array = new Array();
         var jfdAr:Array = new Array();
         var bowYN:Array = new Array();
         var ar:Array = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         var i:int = 0;
         while(i < ar.length)
         {
            k = 0;
            while(k < ItemPositionRange.POSITION_XUNZHANG_ARR.length)
            {
               j = 0;
               while(j < ItemPositionRange.POSITION_XUNZHANG_ARR[k].length)
               {
                  if(ar[i].res.position == ItemPositionRange.POSITION_XUNZHANG_ARR[k][j])
                  {
                     wulizhiAr.push(ar[i]);
                  }
                  j++;
               }
               k++;
            }
            m = 0;
            while(m < ItemPositionRange.POSITION_ZHANQI_ARR.length)
            {
               n = 0;
               while(n < ItemPositionRange.POSITION_ZHANQI_ARR[m].length)
               {
                  if(ar[i].res.position == ItemPositionRange.POSITION_ZHANQI_ARR[m][n])
                  {
                     zhanqiAr.push(ar[i]);
                  }
                  n++;
               }
               m++;
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_JINZHONGZHAO1 || ar[i].res.position == ItemPositionRange.POSTION_JINZHONGZHAO2)
            {
               CJTBSAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_CHAOFANTUOSU || ar[i].res.position == ItemPositionRange.POSTION_NIEPANCHONGSHENG)
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
            if(ar[i].res.position == ItemPositionRange.POSTION_ANQI_DUOMINGCHIZHEN || ar[i].res.position == ItemPositionRange.POSTION_20171115KONGQUEYUPEI)
            {
               anQiAr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSTION_BOW_ZHUANGBEI1 || ar[i].res.position == ItemPositionRange.POSTION_BOW_ZHUANGBEI2)
            {
               bowArr.push(ar[i]);
            }
            if(ItemPositionRange.POSITION_LLZB.indexOf(ar[i].res.position) != -1)
            {
               llzbArr.push(ar[i]);
            }
            if(ar[i].res.position == ItemPositionRange.POSITION_LIANZHOUNU)
            {
               bowYN.push(ar[i]);
            }
            i++;
         }
         this.attrPanel.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         this.attrPanel.setWuliItems(wulizhiAr);
         this.attrPanel.setZhanqiItems(zhanqiAr);
         this.attrPanel.set_CJTBS(CJTBSAr);
         this.attrPanel.set_TSJJ(TSJJAr);
         this.attrPanel.set_BGHL(BGHLAr);
         this.attrPanel.set_XLSBZ(XLSBZAr);
         this.attrPanel.set_SLZ_HDZB(SLZ_HDZBAr);
         this.attrPanel.set_ZhuXunzhang(ZhuXunzhangAr);
         this.attrPanel.setAnQiZhuangBei(anQiAr);
         this.attrPanel.setBowEquip(bowArr);
         this.attrPanel.setYNBowEquip(bowYN);
         this.attrPanel.set_YNliulongzhuangbei(llzbArr);
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
         }
         if(GameInstance.mainCharData.attributeInfo.taoZhuang)
         {
            this.attrPanel.setSiShengShouState(12,12,12,12);
         }
         else
         {
            siShengShouArr = ExchangePositionManager.getSiShengShouStatus(bodyArr);
            if(siShengShouArr.length > 0)
            {
               this.attrPanel.setSiShengShouState(siShengShouArr[0],siShengShouArr[1],siShengShouArr[2],siShengShouArr[3]);
            }
            else
            {
               this.attrPanel.setSiShengShouState(0,0,0,0);
            }
         }
         goodID = GameInstance.mainCharData.attributeInfo.yupeiID;
         if(goodID != 0)
         {
            goods = new Goods(goodID);
            goods.position = goods.res.position;
            goods.roleID = GameInstance.mainChar.id;
            this.attrPanel.setYupei(goods);
         }
         else
         {
            this.attrPanel.setYupei();
         }
         this.attrPanel.setICOXiantian(GameInstance.mainCharData.attributeInfo.isJiHuoXianTianWuJing == 1,GameInstance.mainCharData.attributeInfo.useTianShengNeiliCount,GameInstance.mainCharData.attributeInfo.shenNongBaiChaoDanSta,GameInstance.mainCharData.attributeInfo.qianNengXinFaSta);
         this.attrPanel.setICORouti(GameInstance.mainCharData.attributeInfo.isJiHuoRoutiJinshen);
         this.attrPanel.setICOHuXinYao(GameInstance.mainCharData.attributeInfo.isHuXinYaoJiHuo);
         this.attrPanel.setICONiXi(GameInstance.mainCharData.attributeInfo.niXiStatus);
         this.attrPanel.setICOFengHuang(GameInstance.mainCharData.attributeInfo.fengHuang);
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
            this.attrPanel.setICOState(booArr[0][0],booArr[0][1],booArr[1][0],booArr[1][1],booArr[2][0],booArr[2][1],booArr[3][0],booArr[3][1],booArr[4][0],booArr[4][1],booArr[5][0],booArr[5][1],booArr[6][0],booArr[6][1],booArr[7][0],booArr[7][1]);
         }
         else
         {
            this.attrPanel.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         }
         if(GameInstance.mainCharData.attributeInfo.taoZhuang)
         {
            this.attrPanel.setSiShengShouState(12,12,12,12);
         }
         else
         {
            siShengShouArr = ExchangePositionManager.getSiShengShouStatus(bodyArr);
            if(siShengShouArr.length > 0)
            {
               this.attrPanel.setSiShengShouState(siShengShouArr[0],siShengShouArr[1],siShengShouArr[2],siShengShouArr[3]);
            }
            else
            {
               this.attrPanel.setSiShengShouState(0,0,0,0);
            }
         }
         goodID = GameInstance.mainCharData.attributeInfo.yupeiID;
         if(goodID != 0)
         {
            goods = new Goods(goodID);
            goods.position = goods.res.position;
            goods.roleID = GameInstance.mainChar.id;
            this.attrPanel.setYupei(goods);
         }
         else
         {
            this.attrPanel.setYupei();
         }
         this.attrPanel.setICOXiantian(GameInstance.mainCharData.attributeInfo.isJiHuoXianTianWuJing == 1,GameInstance.mainCharData.attributeInfo.useTianShengNeiliCount,GameInstance.mainCharData.attributeInfo.shenNongBaiChaoDanSta,GameInstance.mainCharData.attributeInfo.qianNengXinFaSta);
         this.attrPanel.setICORouti(GameInstance.mainCharData.attributeInfo.isJiHuoRoutiJinshen);
         this.attrPanel.setICOHuXinYao(GameInstance.mainCharData.attributeInfo.isHuXinYaoJiHuo);
         this.attrPanel.setICONiXi(GameInstance.mainCharData.attributeInfo.niXiStatus);
         this.attrPanel.setICOFengHuang(GameInstance.mainCharData.attributeInfo.fengHuang);
      }
      
      public function setZhanhunUpdata() : void
      {
         if(this.attrPanel.getZhanhunVis())
         {
            this.attrPanel.setZhanhunQingqiu();
         }
      }
      
      public function showCharAttribute() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showWulizhi();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.setWuliItems(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.showWulizhi();
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
         }
      }
      
      public function showCharAttribute_Zhanqi() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showZhanqi();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.setZhanqiItems(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.showZhanqi();
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
         }
      }
      
      public function showCharAttribute_jinzhongzhao() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showJinZhongZhao();
            this.attrPanel.requestJingZhongZhao();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_CJTBS(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"12");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestJingZhongZhao();
         }
      }
      
      public function showCharAttribute_jingjie() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showJingJie();
            this.attrPanel.requestJingJie();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_TSJJ(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(1,"9");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestJingJie();
         }
      }
      
      public function showCharAttribute_bagua() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showSmithingBodyB();
            this.attrPanel.requestBaGuaZhang();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_BGHL(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"1");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestBaGuaZhang();
         }
      }
      
      public function showCharAttribute_xlsbz() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showXiangLongShiBaZhang();
            this.attrPanel.requestXiangLong();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XLSBZ(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"11");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestXiangLong();
         }
      }
      
      public function showCharAttribute_silingzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showSiLingZhen();
            this.attrPanel.requestSiLingZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_SLZ_HDZB(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"2");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestSiLingZhen();
         }
      }
      
      public function showCharAttribute_wuxingzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showWuXingZhen();
            this.attrPanel.requestWuXingZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_ZhuXunzhang(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"4");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestWuXingZhen();
         }
      }
      
      public function showCharAttribute_wuxingzhenXz() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showWuXingZhen();
            this.attrPanel.requestWuXingZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_WuXingZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"4");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestWuXingZhen();
         }
      }
      
      public function showCharAttribute_AnQi() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showAnqi();
            this.attrPanel.requestShowAnQiPanel();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.visible = true;
            this.attrPanel.setAnQiZhuangBei(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(3,"1");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowAnQiPanel();
         }
      }
      
      public function showCharAttribute_bow() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showBow();
            this.attrPanel.requestShowBowPanel();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.visible = true;
            this.attrPanel.setBowEquip(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(3,"2");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowBowPanel();
         }
      }
      
      public function showCharAttribute_tianmenzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showTianMenZhen();
            this.attrPanel.requestShowTianMenZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_TianMenZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"11");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowTianMenZhen();
         }
      }
      
      public function showCharAttribute_hanbingshenzhang() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showHanBingShenZhang();
            this.attrPanel.requestShowHanBingShenZhang();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_HanBingShenZhang(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"40");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowHanBingShenZhang();
         }
      }
      
      public function showCharAttribute_hutaozhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showHuTaoZhen();
            this.attrPanel.requestShowHuTaoZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_HuTaoZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"18");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowHuTaoZhen();
         }
      }
      
      public function showCharAttribute_qinlonggong() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showQinLongGong();
            this.attrPanel.requestShowQinLongGong();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_QinLongGong(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"21");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowQinLongGong();
         }
      }
      
      public function showCharAttribute_aojianshenjiangji() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showAoJianShenJiangJi();
            this.attrPanel.requestShowAoJianShenJiangJi();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_AoJianShenJiangJi(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowAoJianShenJiangJi();
         }
      }
      
      public function showCharAttribute_mingjiaozhangwuji() : void
      {
      }
      
      public function showCharAttribute_juezhanguangmingding() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showJueZhanGuangMingDing();
            this.attrPanel.requestShowJueZhanGuangMingDing();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_JueZhanGuangMingDing(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(5,"1");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowJueZhanGuangMingDing();
         }
      }
      
      public function showCharAttribute_yunlongzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showYunLongZhen();
            this.attrPanel.requestShowYunLongZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_YunLongZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"19");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowYunLongZhen();
         }
      }
      
      public function showCharAttribute_changshezhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showChangSheZhen();
            this.attrPanel.requestShowChangSheZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_ChangSheZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"15");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowChangSheZhen();
         }
      }
      
      public function showCharAttribute_yijinjing() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showYiJinJing();
            this.attrPanel.requestShowYiJinJing();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_YiJinJing(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"3");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowYiJinJing();
         }
      }
      
      public function showCharAttribute_xuantiejianfa() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showXuanTieJianFa();
            this.attrPanel.requestShowXuanTieJianFa();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XuanTieJianFa(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"31");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowXuanTieJianFa();
         }
      }
      
      public function showCharAttribute_yanyuezhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showYanYueZhen();
            this.attrPanel.requestShowYanYueZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_YanYueZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"14");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowYanYueZhen();
         }
      }
      
      public function showCharAttribute_xuanxiangzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showXuanXiangZhen();
            this.attrPanel.requestShowXuanXiangZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XuanXiangZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"16");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowXuanXiangZhen();
         }
      }
      
      public function showCharAttribute_canhezhi() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showCanHeZhi();
            this.attrPanel.requestShowCanHeZhi();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_CanHeZhi(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"25");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowCanHeZhi();
         }
      }
      
      public function showCharAttribute_jiuquhuanghezhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showJiuQuHuangHeZhen();
            this.attrPanel.requestShowJiuQuHuangHeZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_JiuQuHuangHeZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"7");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowJiuQuHuangHeZhen();
         }
      }
      
      public function showCharAttribute_xiantiangong() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showXianTianGong();
            this.attrPanel.requestShowXianTianGong();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XianTianGong(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"26");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowXianTianGong();
         }
      }
      
      public function showCharAttribute_changshengjue() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showChangShengJue();
            this.attrPanel.requestShowChangShengJue();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_ChangShengJue(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"32");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowChangShengJue();
         }
      }
      
      public function showCharAttribute_taixuanshengong() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showTaiXuanShenGong();
            this.attrPanel.requestTaiXuanShenGong();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_TaiXuanShenGong(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"13");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestTaiXuanShenGong();
         }
      }
      
      public function showCharAttribute_guiliuzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showGuiLiuZhen();
            this.attrPanel.requestShowGuiLiuZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_GuiLiuZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"9");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowGuiLiuZhen();
         }
      }
      
      public function showCharAttribute_wuxingzhiren() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showWuXingZhiRen();
            this.attrPanel.requestShowWuXingZhiRen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_WuXingZhiRen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(3,"4");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowWuXingZhiRen();
         }
      }
      
      public function showCharAttribute_wuxingzhiren2() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showWuXingZhiRen();
            this.attrPanel.requestShowWuXingZhiRen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.setZhuangbei2(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(3,"4");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowWuXingZhiRen();
         }
      }
      
      public function showCharAttribute_wuxingquan() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showWuXingQuan();
            this.attrPanel.requestShowWuXingQuan();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_WuXingQuan(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"9");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowWuXingQuan();
         }
      }
      
      public function showCharAttribute_chixuemozhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showChiXueMoZhen();
            this.attrPanel.requestShowChiXueMoZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_ChiXueMoZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"5");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowChiXueMoZhen();
         }
      }
      
      public function showCharAttribute_roushen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showSmithingBody();
            this.attrPanel.requestSmithingBody();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_RouShen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(1,"3");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestSmithingBody();
         }
      }
      
      public function showCharAttribute_lianqi() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showLianQi();
            this.attrPanel.requestShowLianQi();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_LianQi(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(1,"13");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowLianQi();
         }
      }
      
      public function showCharAttribute_xueyinjuexing() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showXueYinJueXing();
            this.attrPanel.requestShowXueYinJueXing();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XueYinJueXing(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(3,"17");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowXueYinJueXing();
         }
      }
      
      public function showCharAttribute_xuedaoxinfa() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showXueDaoXinFa();
            this.attrPanel.requestShowXueDaoXinFa();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XueDaoXinFa(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"27");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowXueDaoXinFa();
         }
      }
      
      public function showCharAttribute_qimenzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showQiMenZhen();
            this.attrPanel.requestShowQiMenZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_QiMenZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"1");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowQiMenZhen();
         }
      }
      
      public function showCharAttribute_bihaichaoshengqu() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showBiHaiChaoShengQu();
            this.attrPanel.requestShowBiHaiChaoShengQu();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_BiHaiChaoShengQu(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"23");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowBiHaiChaoShengQu();
         }
      }
      
      public function showCharAttribute_bazhentu() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showBaZhenTu();
            this.attrPanel.requestShowBaZhenTu();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_BaZhenTu(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"26");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowBaZhenTu();
         }
      }
      
      public function showCharAttribute_lingxiyizhi() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showLingXiYiZhi();
            this.attrPanel.requestShowLingXiYiZhi();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_LingXiYiZhi(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"41");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowLingXiYiZhi();
         }
      }
      
      public function showCharAttribute_jingangfumoquan() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showJinGangFuMoQuan();
            this.attrPanel.requestShowJinGangFuMoQuan();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_JinGangFuMoQuan(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.set_JinGangFuMoQuan1(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"10");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowJinGangFuMoQuan();
         }
      }
      
      public function showCharAttribute_shicong() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._meiren))
         {
            GameInstance.uiInstance.charAttribute.requestShowShiCong();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            GameInstance.uiInstance.charAttribute.requestShowShiCong();
         }
      }
      
      public function showCharAttribute_zhenwuqijiezhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showZhenWuQiJieZhen();
            this.attrPanel.requestShowZhenWuQiJieZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_ZhenWuQiJieZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"8");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowZhenWuQiJieZhen();
         }
      }
      
      public function showCharAttribute_xiuwei() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showXiuWei();
            this.attrPanel.requestShowXiuWei();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XiuWei(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(1,"7");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowXiuWei();
         }
      }
      
      public function showCharAttribute_ganjiangmoye() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showGanJiangMoYe();
            this.attrPanel.requestShowGanJiangMoYe();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_GanJiangMoYe(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(3,"7");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowGanJiangMoYe();
         }
      }
      
      public function showCharAttribute_beidouqixingzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showBeiDouQiXing();
            this.attrPanel.requestBeiDouQiXing();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_BeiDouQiXingZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"6");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestBeiDouQiXing();
         }
      }
      
      public function showCharAttribute_huashanlunjian() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showHuaShanLunJian();
            this.attrPanel.requestShowHuashanlunjian();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_HuaShanLunJian(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(5,"5");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowHuashanlunjian();
         }
      }
      
      public function showCharAttribute_beimingshengong() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showBeiMingShenGong();
            this.attrPanel.requestShowBeiMingShenGong();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_BeiMingShenGong(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"14");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowBeiMingShenGong();
         }
      }
      
      public function showCharAttribute_fumozhangfa() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showFuMoZhangFa();
            this.attrPanel.requestShowFuMoZhangFa();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_FuMoZhangFa(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"35");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowFuMoZhangFa();
         }
      }
      
      public function showCharAttribute_jiuyinzhenjing() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showJiuyinZhenjing();
            this.attrPanel.requestShowJiuYinZhenJing();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_JiuYinZhenJing(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"7");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowJiuYinZhenJing();
         }
      }
      
      public function showCharAttribute_dugujiujian() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showDugujiujian();
            this.attrPanel.requestShowDugujiujianPanel();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_DuGuJiuJian(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"4");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowDugujiujianPanel();
         }
      }
      
      public function showCharAttribute_yuncheng() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showYunCheng();
            this.attrPanel.requestShowYunCheng();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_YunCheng(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(1,"4");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowYunCheng();
         }
      }
      
      public function showCharAttribute_heyizhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showHeYiZhen();
            this.attrPanel.requestShowHeYiZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_HeYiZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"12");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowHeYiZhen();
         }
      }
      
      public function showCharAttribute_YNliulongzhuangbei() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.permitYNliulongzhuangbei(true);
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_YNliulongzhuangbei(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(1,"20");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.permitYNliulongzhuangbei(true);
         }
      }
      
      public function showCharAttribute_YNJinfengdiao() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.permitYNJinfengdiao(true);
            this.attrPanel.requestShowYNJinfengdiao();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_YNJinfengdiao(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(3,"19");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.permitYNJinfengdiao(true);
         }
      }
      
      public function showCharAttribute_YNDouzhuanxingyi() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.permitDouZhuanXingYi(true);
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.setDouzhuangxingyiZhuangbei(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"20");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.permitDouZhuanXingYi(true);
         }
      }
      
      public function showCharAttribute_qishazhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showQiShaZhen();
            this.attrPanel.requestShowQiShaZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_QiShaZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"32");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowQiShaZhen();
         }
      }
      
      public function showCharAttribute_xingxiuzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showXingXiuZhen();
            this.attrPanel.requestShowXingXiuZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XingXiuZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"31");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowXingXiuZhen();
         }
      }
      
      public function showCharAttribute_rijinlun() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showRijinlun();
            this.attrPanel.requestShowRijinlun();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_Rijinlun(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(3,"16");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowRijinlun();
         }
      }
      
      public function showCharAttribute_mingyugong() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showMingYuGong();
            this.attrPanel.requestMingYuGong();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_RongQingAiYi(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"43");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestMingYuGong();
         }
      }
      
      public function showCharAttribute_xisuijing() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showYiJinJing_X();
            this.attrPanel.requestXiSuiJing();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_XiSuiJing(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(2,"6");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestXiSuiJing();
         }
      }
      
      public function showCharAttribute_wuhun() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance.wuhunxitongPanel))
         {
            PipeManager.sendMsg(PipeConstants.GET_WUHUNXITONG_PANEL);
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            PipeManager.sendMsg(PipeConstants.GET_WUHUNXITONG_PANEL);
         }
      }
      
      public function showCharAttribute_sijuejianzhen() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showSiJueJianZhen();
            this.attrPanel.requestShowSiJueJianZhen();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_SiJueJianZhen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(4,"36");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowSiJueJianZhen();
         }
      }
      
      public function showCharAttribute_guihun() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            this.attrPanel.showYNGuiHun();
            this.attrPanel.requestShowYNGuiHun();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(this.attrPanel);
            this.attrPanel.set_GuiHun(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
            this.attrPanel.initCharPanel(1,"22");
            ResizeManager.showDoublePanel(this.attrPanel,this.backpack);
            this.attrPanel.requestShowYNGuiHun();
         }
      }
   }
}

