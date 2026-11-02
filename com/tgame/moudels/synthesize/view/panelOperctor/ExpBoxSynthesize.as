package com.tgame.moudels.synthesize.view.panelOperctor
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SynthesizeMsg;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneRender;
   
   public class ExpBoxSynthesize extends BaseSynthesize
   {
      
      private static var _equipSynthesize:ExpBoxSynthesize;
      
      private var lastTime:int = 0;
      
      public function ExpBoxSynthesize()
      {
         super();
      }
      
      public static function getExpBoxSynthesize() : ExpBoxSynthesize
      {
         if(!_equipSynthesize)
         {
            _equipSynthesize = new ExpBoxSynthesize();
         }
         return _equipSynthesize;
      }
      
      override public function addListener() : void
      {
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_JINGYANHE_GETEQUIPBTN_CLICK,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_JINGYANHE_SETEQUIPBTN_CLICK,this.mainCharSynthesizeHandle);
         super.itemSynthesizePanel.addEventListener(ItemSynthesizePanel.UI_JINGYANHE_STARTBTN_CLICK,this.mainCharSynthesizeHandle);
      }
      
      public function setStone(param1:Object) : void
      {
         var _loc2_:Goods = new Goods(param1.nextLevelData);
         itemSynthesizePanel.setStone(super.equip,_loc2_);
      }
      
      public function getbackItem(param1:Array) : void
      {
         var _loc2_:Goods = null;
         if(super.equip)
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1[param1.length - 1]);
            param1.splice(-1,1);
            itemSynthesizePanel.setResult(param1);
            this.itemToPanel(_loc2_,false);
         }
      }
      
      private function mainCharSynthesizeHandle(param1:BaseEvent) : void
      {
         var _loc2_:Object = null;
         switch(param1.type)
         {
            case ItemSynthesizePanel.UI_JINGYANHE_SETEQUIPBTN_CLICK:
               super.resumMouseStatus();
               itemSynthesizePanel.setResult([]);
               super.chickItemToPanelFun = this.setItem;
               super.openBackpack();
               super.changeMouseStatus();
               break;
            case ItemSynthesizePanel.UI_JINGYANHE_STARTBTN_CLICK:
               if(!super.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,"请放入经验盒",false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"请放入经验盒",false);
                  return;
               }
               if(SceneRender.nowTime - this.lastTime < 500)
               {
                  return;
               }
               this.lastTime = SceneRender.nowTime;
               _loc2_ = {};
               _loc2_.XY = super.equip.position;
               BaseSynthesize.addLoadBuffer();
               itemSynthesizePanel.setResult([]);
               BaseSynthesize.sendMsgFun.send_53525(_loc2_);
               SynthesizeMsg.SynthesizeSmallLoadingBarMsg = LanResManager.getLanCommonTextWords("经验盒合成中");
               break;
            case ItemSynthesizePanel.UI_JINGYANHE_GETEQUIPBTN_CLICK:
               itemSynthesizePanel.setResult([]);
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.panelClose();
         }
      }
      
      private function setItem(param1:ItemFace) : void
      {
         var _loc2_:Goods = null;
         if(param1 == null || !Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
         {
            return;
         }
         if(param1.getBaseItem() is Goods)
         {
            if(BaseSynthesize.nowPanelType == ItemSynthesizePanel.UI_JINGYANHE_SHOW)
            {
               _loc2_ = param1.getBaseItem() as Goods;
               this.itemToPanel(_loc2_);
            }
         }
      }
      
      private function itemToPanel(param1:Goods, param2:Boolean = true) : void
      {
         var _loc4_:Object = null;
         var _loc3_:Array = [7339,2035,2036,2037,2038,2039];
         if(Boolean(param1) && _loc3_.indexOf(param1.id) != -1)
         {
            super.equip = param1;
            _loc4_ = {};
            _loc4_.XY = param1.position;
            _loc4_.ID = param1.id;
            _loc4_.type = 19;
            BaseSynthesize.tempData = _loc4_;
            BaseSynthesize.sendMsgFun.send_50125(_loc4_);
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            super.mouseToNormal();
         }
         else
         {
            if(param2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该物品不是经验盒"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该物品不是经验盒"),false);
            }
            itemSynthesizePanel.setStone();
         }
      }
      
      public function panelClose() : void
      {
         itemSynthesizePanel.setResult([]);
         itemSynthesizePanel.setStone(null,null);
         super.closePanel();
      }
   }
}

