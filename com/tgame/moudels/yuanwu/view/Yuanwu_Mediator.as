package com.tgame.moudels.yuanwu.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.common.auto.AutoMediator;
   import com.tgame.moudels.yuanwu.model.Yuanwu_SenderProxy;
   import com.tgame.shell.view.components.utils.UITools;
   import com.tgame.shell.view.components.yuanwu.TargetYuanwuPanel;
   import com.tgame.shell.view.components.yuanwu.XuanyuanhuanyuejianPanel;
   import com.tgame.shell.view.components.yuanwu.YuanwuPanel;
   import com.tgame.shell.view.components.yuanwu.YuanwupeiyangPanel;
   import com.tgame.shell.view.components.yuanwu.YuanwushuomingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   
   public class Yuanwu_Mediator extends AutoMediator
   {
      
      public static const NAME:String = "Yuanwu_Mediator";
      
      private var _isAuto:Boolean = false;
      
      private var _functionId:int;
      
      private var goodID:int;
      
      private var goodCount:int;
      
      private var arrSkill:Array = [];
      
      private var chongshengMax:int;
      
      private var itemres:int = 0;
      
      private var arrEquips:Array = [];
      
      private var currGood:Goods;
      
      private var peiyangGoods:Goods;
      
      private var skillChongshengArr:Array = [];
      
      private var playerID:int;
      
      private var _viewComponentInited:Boolean = false;
      
      private var _peiyangPanel:YuanwupeiyangPanel;
      
      private var _targetPanel:TargetYuanwuPanel;
      
      private var _jieshaoPanel:YuanwushuomingPanel;
      
      private var _sender:Yuanwu_SenderProxy;
      
      private var _shuxingPanel:XuanyuanhuanyuejianPanel;
      
      public function Yuanwu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YuanwuPanel,function():void
         {
            panel.addEventListener(YuanwuPanel.YUANWU_XINXI,onMyPanel);
            panel.addEventListener(YuanwuPanel.YUANWU_ZHUANGBEIJIESHAO_PANEL,onMyPanel);
            panel.addEventListener(YuanwuPanel.YUANWU_TARGET_XINXI,onMyPanel);
            panel.addEventListener(YuanwuPanel.YUANWU_TUOXIA,onMyPanel);
            panel.addEventListener(YuanwuPanel.YUANWU_ZHANSHI,onMyPanel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YuanwuPanel,function():void
         {
            panel.removeEventListener(YuanwuPanel.YUANWU_XINXI,onMyPanel);
            panel.removeEventListener(YuanwuPanel.YUANWU_ZHUANGBEIJIESHAO_PANEL,onMyPanel);
            panel.removeEventListener(YuanwuPanel.YUANWU_TARGET_XINXI,onMyPanel);
            panel.removeEventListener(YuanwuPanel.YUANWU_TUOXIA,onMyPanel);
            panel.removeEventListener(YuanwuPanel.YUANWU_ZHANSHI,onMyPanel);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YuanwupeiyangPanel,function():void
         {
            peiyangpanel.addEventListener(YuanwupeiyangPanel.AutoBuy,onMyPanel);
            peiyangpanel.addEventListener(YuanwupeiyangPanel.YUANWU_CHONGSHENGSUODING,onMyPanel);
            peiyangpanel.addEventListener(YuanwupeiyangPanel.Chongsheng,onMyPanel);
            peiyangpanel.addEventListener(YuanwupeiyangPanel.TAKEOUTALL,onMyPanel);
            peiyangpanel.addEventListener(YuanwupeiyangPanel.SET_EQUIP,onMyPanel);
            peiyangpanel.addEventListener(YuanwupeiyangPanel.EAT_UP,onMyPanel);
            peiyangpanel.addEventListener(YuanwupeiyangPanel.AUTO_SET,onMyPanel);
            peiyangpanel.addEventListener(YuanwupeiyangPanel.NULL_SKILLARR,onMyPanel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YuanwupeiyangPanel,function():void
         {
            peiyangpanel.removeEventListener(YuanwupeiyangPanel.AutoBuy,onMyPanel);
            peiyangpanel.removeEventListener(YuanwupeiyangPanel.YUANWU_CHONGSHENGSUODING,onMyPanel);
            peiyangpanel.removeEventListener(YuanwupeiyangPanel.Chongsheng,onMyPanel);
            peiyangpanel.removeEventListener(YuanwupeiyangPanel.TAKEOUTALL,onMyPanel);
            peiyangpanel.removeEventListener(YuanwupeiyangPanel.SET_EQUIP,onMyPanel);
            peiyangpanel.removeEventListener(YuanwupeiyangPanel.EAT_UP,onMyPanel);
            peiyangpanel.removeEventListener(YuanwupeiyangPanel.AUTO_SET,onMyPanel);
            peiyangpanel.removeEventListener(YuanwupeiyangPanel.NULL_SKILLARR,onMyPanel);
         });
         UIEventsRegisterManager.addUIRegisterEvent(TargetYuanwuPanel,function():void
         {
            targetPanel.addEventListener(YuanwuPanel.YUANWU_TARGET_XINXI,onMyPanel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetYuanwuPanel,function():void
         {
            targetPanel.removeEventListener(YuanwuPanel.YUANWU_TARGET_XINXI,onMyPanel);
         });
      }
      
      private function onMyPanel(param1:BaseEvent) : void
      {
         var data:Object = null;
         var itemFace:ItemFace = null;
         var goodsItem:Goods = null;
         var obj:Object = null;
         var info:GoodsInfo = null;
         var ar:Array = null;
         var str:String = null;
         var i:int = 0;
         var e:BaseEvent = param1;
         data = e.data;
         switch(e.type)
         {
            case YuanwupeiyangPanel.AutoBuy:
               isAutoBuy = data;
               break;
            case YuanwupeiyangPanel.YUANWU_CHONGSHENGSUODING:
               this.chongshengHanlder(data);
               break;
            case YuanwupeiyangPanel.Chongsheng:
               this.chongSheng();
               break;
            case YuanwuPanel.YUANWU_XINXI:
               this.sender.send_83059([int(data),GameInstance.mainChar.id]);
               break;
            case YuanwuPanel.YUANWU_TARGET_XINXI:
               this.sender.send_83059([int(data),GameInstance.lookPlayerID]);
               break;
            case YuanwuPanel.YUANWU_TUOXIA:
               itemFace = data as ItemFace;
               goodsItem = itemFace.getBaseItem() as Goods;
               this.sender.send_10075([goodsItem.position,0,0,goodsItem.res.position,ItemPositionRange.CONTAINER_BAG]);
               break;
            case YuanwupeiyangPanel.TAKEOUTALL:
               this.arrEquips = [];
               this.peiyangpanel.clearAll(true);
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               PipeManager.sendMsg(PipeConstants.LOCK_BACKPACK,false);
               this.resumMouseStatus();
               break;
            case YuanwupeiyangPanel.SET_EQUIP:
               if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
               {
                  return;
               }
               this.itemres = GoodsKind.K62;
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case YuanwupeiyangPanel.EAT_UP:
               obj = {};
               obj.post = this.peiyangGoods.position;
               obj.arr = this.arrEquips;
               if(this.isZisePinzhiZhishang(obj.arr))
               {
                  FAlert.okLabel = "确定";
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  str = "列表中有高品质装备存在，是否确认吞噬？";
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        sender.send_83039(obj);
                        peiyangpanel.clearAll(true);
                        arrEquips = [];
                        resumMouseStatus();
                     }
                  },true);
                  break;
               }
               this.sender.send_83039(obj);
               this.peiyangpanel.clearAll(true);
               this.arrEquips = [];
               this.resumMouseStatus();
               break;
            case YuanwupeiyangPanel.AUTO_SET:
               info = GameInstance.mainCharData.goodsInfo;
               ar = info.findGoodsByYuanwu(this.peiyangGoods.res.position);
               i = 0;
               while(i < ar.length)
               {
                  if(ar[i].position == this.peiyangGoods.position)
                  {
                     ar.splice(i,1);
                  }
                  i++;
               }
               if(ar.length <= 5)
               {
                  if(ar.length <= 0)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,"没有可吞噬的物品");
                  }
                  else
                  {
                     this.arrEquips = ar;
                  }
               }
               else
               {
                  this.arrEquips = ar.slice(0,5);
               }
               this.peiyangpanel.addEquipArr(this.arrEquips);
               this.resumMouseStatus();
               break;
            case YuanwupeiyangPanel.NULL_SKILLARR:
               this.chongshengNull();
               break;
            case YuanwuPanel.YUANWU_ZHUANGBEIJIESHAO_PANEL:
               this.showJieshaoPanel();
               break;
            case YuanwuPanel.YUANWU_ZHANSHI:
               this.sender.send_83057(data);
         }
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         super.handleNotification(param1);
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case PipeConstants.GOODS_CHANGED:
               if(!this._peiyangPanel)
               {
                  return;
               }
               if(this._viewComponentInited && !Fun.isVisible(this.peiyangpanel))
               {
                  return;
               }
               this._viewComponentInited = true;
               this.peiyangpanel.refuseGood();
               break;
            case PipeConstants.SHOW_YUANWU_PANEL:
               this.onMainPanel();
               break;
            case PipeConstants.SHOW_TARGETYUANWU_PANEL:
               this.onTargetAttribute();
               break;
            case PipeConstants.SHOW_YUANWUPEIYANG_PANEL:
               PipeManager.sendMsg(PipeConstants.LOCK_BACKPACK,true);
               _loc3_ = _loc2_ as Goods;
               this.sender.send_83033([_loc3_.id,_loc3_.position]);
               this.arrSkill = [];
               break;
            case PipeConstants.SHOW_YUANWUPEIDAI_PANEL:
               _loc3_ = _loc2_ as Goods;
               this.sender.send_83037([_loc3_.id,_loc3_.position]);
               break;
            case PipeConstants.SHOW_YUANWUHEXIN_PANEL:
               this.sender.send_83051(int(_loc2_));
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         var _loc1_:Array = [PipeConstants.GOODS_CHANGED,PipeConstants.SHOW_YUANWU_PANEL,PipeConstants.SHOW_YUANWUPEIYANG_PANEL,PipeConstants.SHOW_TARGETYUANWU_PANEL,PipeConstants.SHOW_YUANWUHEXIN_PANEL,PipeConstants.SHOW_YUANWUPEIDAI_PANEL];
         return _loc1_.concat(super.listNotificationInterests());
      }
      
      private function chongshengHanlder(param1:Object) : void
      {
         if(Boolean(param1.selected) && this.arrSkill.length < this.chongshengMax)
         {
            this.arrSkill.push(param1.id);
            this.goodsNum(this.arrSkill.length);
         }
         else if(Boolean(param1.selected) && this.arrSkill.length >= this.chongshengMax)
         {
            NoticeManager.notify(NoticeManager.FOOT,"此品质最多可锁定" + this.chongshengMax + "条属性");
            this.arrSkill.push(param1.id);
            this.goodsNum(this.arrSkill.length);
         }
         else if(param1.selected == false)
         {
            if(this.arrSkill.indexOf(param1.id) >= 0)
            {
               this.arrSkill.splice(this.arrSkill.indexOf(param1.id),1);
               this.goodsNum(this.arrSkill.length);
            }
         }
      }
      
      private function isZisePinzhiZhishang(param1:Array) : Boolean
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_].res.grade >= 4)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function goodsNum(param1:int) : void
      {
         this.goodCount = 5 * (param1 + 1);
         this.peiyangpanel.goodsNum(this.goodCount);
      }
      
      private function chongSheng() : void
      {
         if(isAutoBuy)
         {
            clearAuto();
            upgradeFun = this.sender.send_83035;
            upgradeData = [[this.arrSkill,this.peiyangGoods.position]];
            addGood(this.goodID,this.goodCount);
            buyAndUpgrade();
            return;
         }
         var _loc1_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         var _loc2_:int = _loc1_.getGoodsNumByID(this.goodID,true);
         if(_loc2_ >= this.goodCount)
         {
            this.sender.send_83035([this.arrSkill,this.peiyangGoods.position]);
         }
         else
         {
            NoticeManager.notify(NoticeManager.FOOT,"道具不足重生失败");
            this.sender.send_83035([this.arrSkill,this.peiyangGoods.position]);
         }
      }
      
      private function chongshengNull() : void
      {
         this.arrSkill = [];
         this.arrEquips = [];
      }
      
      private function onMainPanel(param1:Event = null) : void
      {
         var _loc3_:String = null;
         var _loc4_:int = 0;
         var _loc2_:Player = GameInstance.mainCharData;
         if(_loc2_.attributeInfo.lv < 100)
         {
            _loc3_ = "人物等级需要100级，才能开启元武";
            NoticeManager.notify(NoticeManager.FOOT,_loc3_);
         }
         else
         {
            _loc4_ = GameInstance.mainChar.id;
            this.sender.send_83059([1,_loc4_]);
         }
      }
      
      private function onTargetAttribute() : void
      {
         var _loc1_:Player = GameInstance.lookPlayerData;
         var _loc2_:String = null;
         if(_loc1_.attributeInfo.lv < 100)
         {
            _loc2_ = "人物等级需要100级，才能开启元武";
         }
         else
         {
            _loc1_ = GameInstance.mainCharData;
            if(_loc1_.attributeInfo.lv < 100)
            {
               _loc2_ = "人物等级需要100级，才能开启元武";
            }
         }
         if(_loc2_)
         {
            NoticeManager.notify(NoticeManager.FOOT,_loc2_);
            return;
         }
         this.sender.send_83059([1,GameInstance.lookPlayerID]);
      }
      
      public function setData(param1:Object) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            UITools.showPanel(this.panel);
            this.playerID = GameInstance.mainChar.id;
         }
         this.panel.setData(param1);
      }
      
      public function showZhanshiPanel() : void
      {
         this.panel.showZhanshiPanel();
      }
      
      public function setZhanshiPanel(param1:String) : void
      {
      }
      
      public function showPeiyangPanel(param1:Object) : void
      {
         this.goodID = param1.goodsId;
         this.goodCount = param1.count;
         this.chongshengMax = param1.chongshengshuliang;
         this.peiyangGoods = new Goods(param1.id);
         this.peiyangGoods.position = param1.post;
         this.peiyangpanel.setInfo(param1);
         this.peiyangpanel.refuseGood();
         if(!Fun.isVisible(this.peiyangpanel))
         {
            UITools.showPanel(this.peiyangpanel);
         }
      }
      
      public function chongshengUpdata(param1:Array) : void
      {
         this.skillChongshengArr = param1;
         this.peiyangpanel.updateData(this.skillChongshengArr);
      }
      
      public function setTargetData(param1:Object) : void
      {
         this.targetPanel.setData(param1);
         if(!Fun.isVisible(this.targetPanel))
         {
            UITools.showPanel(this.targetPanel);
         }
      }
      
      public function showJieshaoPanel() : void
      {
         if(!Fun.isVisible(this.jieshaoPanel))
         {
            UITools.showPanel(this.jieshaoPanel);
         }
         else
         {
            this.jieshaoPanel.onClose();
         }
      }
      
      public function shuxingsetDataPanel(param1:int, param2:int, param3:Array) : void
      {
         if(!Fun.isVisible(this.shuxingPanel))
         {
            UITools.showPanel(this.shuxingPanel);
         }
         this.shuxingPanel.setData(param1,param2,param3);
      }
      
      public function setZhuangbei(param1:Object) : void
      {
         this.panel.setZhuangbei(param1);
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc3_:Object = {};
         var _loc4_:Boolean = true;
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(param2.position < ItemPositionRange.GOODS_IN_BAG_RANGE.x || param2.position > ItemPositionRange.GOODS_IN_BAG_RANGE.y)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
         }
         if(param1)
         {
            _loc5_ = param1.getBaseItem() as Goods;
            _loc6_ = [2922,2923,2924];
            if(this.itemres == GoodsKind.K62 && _loc5_.res.kind == GoodsKind.K62 || _loc6_.indexOf(_loc5_.id) >= 0)
            {
               _loc7_ = 0;
               while(_loc7_ < this.arrEquips.length)
               {
                  if(this.arrEquips[_loc7_].position == this.peiyangGoods.position)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不可吞噬自身",false);
                     NoticeManager.notify(NoticeManager.FOOT,"不可吞噬自身",false);
                     return;
                  }
                  if(this.arrEquips[_loc7_].position == param2.position)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不可重复添加",false);
                     NoticeManager.notify(NoticeManager.FOOT,"不可重复添加",false);
                     return;
                  }
                  _loc7_++;
               }
               if(param2.position == this.peiyangGoods.position)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"不可吞噬自身",false);
                  NoticeManager.notify(NoticeManager.FOOT,"不可吞噬自身",false);
                  return;
               }
               if(_loc6_.indexOf(_loc5_.id) < 0)
               {
                  if(param2.res.position != this.peiyangGoods.res.position)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"请放入相同佩戴位置元武",false);
                     NoticeManager.notify(NoticeManager.FOOT,"请放入相同佩戴位置元武",false);
                     return;
                  }
               }
               this.arrEquips.push(param2);
               this.peiyangpanel.addEquip(param2);
               if(this.arrEquips.length >= 5)
               {
                  this.resumMouseStatus();
               }
            }
            else
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"该物品不是元武道具",false);
               NoticeManager.notify(NoticeManager.FOOT,"该物品不是元武道具",false);
            }
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
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
      
      private function get panel() : YuanwuPanel
      {
         if(!viewComponent)
         {
            viewComponent = GameInstance.uiInstance.yuanwu;
         }
         return viewComponent as YuanwuPanel;
      }
      
      private function get peiyangpanel() : YuanwupeiyangPanel
      {
         if(!this._peiyangPanel)
         {
            this._peiyangPanel = new YuanwupeiyangPanel();
            UIEventsRegisterManager.registerUI(this._peiyangPanel,YuanwupeiyangPanel);
         }
         return this._peiyangPanel as YuanwupeiyangPanel;
      }
      
      private function get targetPanel() : TargetYuanwuPanel
      {
         if(!this._targetPanel)
         {
            this._targetPanel = GameInstance.uiInstance.targetyuanwu;
            UIEventsRegisterManager.registerUI(this._targetPanel,TargetYuanwuPanel);
         }
         return this._targetPanel;
      }
      
      private function get jieshaoPanel() : YuanwushuomingPanel
      {
         if(!this._jieshaoPanel)
         {
            this._jieshaoPanel = new YuanwushuomingPanel();
         }
         return this._jieshaoPanel;
      }
      
      private function get sender() : Yuanwu_SenderProxy
      {
         if(!this._sender)
         {
            this._sender = facade.retrieveProxy(Yuanwu_SenderProxy.NAME) as Yuanwu_SenderProxy;
         }
         return this._sender;
      }
      
      private function get shuxingPanel() : XuanyuanhuanyuejianPanel
      {
         if(!this._shuxingPanel)
         {
            this._shuxingPanel = new XuanyuanhuanyuejianPanel();
            this._shuxingPanel.$parent = this.panel;
         }
         return this._shuxingPanel;
      }
   }
}

