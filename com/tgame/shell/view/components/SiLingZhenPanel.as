package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.siLingZhen.SiLingZhenCanvas;
   import com.tgame.shell.view.components.siLingZhen.SiLingZhenUpgradePanel;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import gs.TweenMax;
   
   public class SiLingZhenPanel extends FPanel
   {
      
      public static const UI_SILINGZHEN_PANEL_ZHENYAN_CLICK:String = "UI_SILINGZHEN_PANEL_ZHENYAN_CLICK";
      
      public static const UI_SILINGZHEN_PANEL_UPGRADE_START:String = "UI_SILINGZHEN_PANEL_UPGRADE_START";
      
      public static const UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO:String = "UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO";
      
      public static const UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP:String = "UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP";
      
      public static const UI_SILINGZHEN_PANEL_UPGRADE_CLOSE:String = "UI_SILINGZHEN_PANEL_UPGRADE_CLOSE";
      
      private var content:SiLingZhenCanvas;
      
      private var upgradePanel:SiLingZhenUpgradePanel;
      
      private var data:Array;
      
      private var upgradePanelMask:Sprite;
      
      private var yanhuaMc:MovieClip;
      
      private var contentMask:Sprite;
      
      public function SiLingZhenPanel()
      {
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         width = 576;
         height = 432;
         titleText = LanResManager.getLanCommonTextWords("四灵阵");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.content = new SiLingZhenCanvas();
         addChild(this.content);
         this.content.$parent = this;
         this.content.x = 10;
         this.contentMask = new Sprite();
         addChild(this.contentMask);
         this.contentMask.graphics.beginFill(0);
         this.contentMask.graphics.drawRect(0,0,560,392);
         this.contentMask.graphics.endFill();
         this.content.mask = this.contentMask;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.content.bg);
         this.DynamicManageImages = _loc1_;
         this.upgradePanelMask = new Sprite();
         this.upgradePanelMask.graphics.beginFill(0,1);
         this.upgradePanelMask.graphics.drawRect(0,0,576,395);
         this.upgradePanelMask.graphics.endFill();
      }
      
      public function get useGoodsType() : int
      {
         return this.upgradePanel ? this.upgradePanel.useGoodsType : 0;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         this.close();
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function close() : void
      {
         if(Boolean(this.upgradePanel) && Boolean(this.upgradePanel.parent))
         {
            this.upgradePanel.closeMC();
         }
         this.content.closeMC();
      }
      
      public function setData(param1:Array) : void
      {
         this.data = param1;
         this.content.setData(param1);
      }
      
      public function setBuffAvatar(param1:int) : void
      {
         this.content.setBuffAvatar(true,param1);
      }
      
      public function setZhenyan(param1:int, param2:int, param3:int) : void
      {
         this.content.setZhenyan(param1,param2,param3);
      }
      
      public function showUpgradePanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Goods, param8:int, param9:int) : void
      {
         var _loc10_:Object = null;
         var _loc11_:int = 0;
         var _loc12_:int = int(this.data.length);
         _loc11_ = 0;
         while(_loc11_ < _loc12_)
         {
            if(this.data[_loc11_].type == param9)
            {
               _loc10_ = this.data[_loc11_];
               break;
            }
            _loc11_++;
         }
         if(this.upgradePanel)
         {
            this.upgradePanel.setUpgradeData(param1,param2,param3,param4,param5,param6,param7,param8,param9,_loc10_);
         }
      }
      
      public function setUpgradePanelVsible(param1:Boolean) : void
      {
         if(this.upgradePanel)
         {
            if(param1)
            {
               if(this.upgradePanel.parent)
               {
                  return;
               }
               addChild(this.upgradePanel);
               this.upgradePanel.x = 0;
               this.upgradePanel.y = 395;
               TweenMax.to(this.upgradePanel,1,{"y":40});
            }
            else
            {
               this.upgradePanel.close();
            }
         }
         else if(param1)
         {
            this.upgradePanel = new SiLingZhenUpgradePanel();
            this.upgradePanel.$parent = this;
            addChild(this.upgradePanel);
            addChild(this.upgradePanelMask);
            this.upgradePanel.mask = this.upgradePanelMask;
            this.upgradePanel.x = 0;
            this.upgradePanel.y = 395;
            TweenMax.to(this.upgradePanel,1,{"y":40});
         }
         if(this.upgradePanel)
         {
            this.upgradePanel.updateData();
         }
      }
      
      public function bofangYanhua() : void
      {
         if(Boolean(this.yanhuaMc) && this.yanhuaMc.parent != null)
         {
            this.yanhuaMc.parent.removeChild(this.yanhuaMc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            yanhuaMc = _loc2_.content as MovieClip;
            yanhuaMc.x = (576 - yanhuaMc.width) / 2;
            yanhuaMc.y = (432 - yanhuaMc.height) / 2;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
      }
      
      public function resetAutoBtnLabel() : void
      {
         if(this.upgradePanel)
         {
            this.upgradePanel.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         }
      }
   }
}

