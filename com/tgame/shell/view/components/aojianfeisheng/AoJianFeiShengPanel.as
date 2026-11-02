package com.tgame.shell.view.components.aojianfeisheng
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class AoJianFeiShengPanel extends FPanel
   {
      
      public static const AOJIANFEISHENG_LINGQU_CLICK:String = "AOJIANFEISHENG_LINGQU_CLICK";
      
      private var boxContainer:Sprite;
      
      private var dataArr:Array = [];
      
      public function AoJianFeiShengPanel()
      {
         super();
         this.titleText = "飞升";
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 650;
         height = 360;
         addEventListener(FCloseEvent.CLOSE,this.onClosePanelHandler);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.initDuiHuanView();
      }
      
      private function onClosePanelHandler(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setAoJianFeiShengData(param1:Array, param2:Array, param3:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         var _loc7_:SecondButton = null;
         var _loc8_:AoJianFeiShengPanelRender = null;
         this.removeContainerBoxChildren();
         _loc4_ = 0;
         while(_loc4_ < param1.length)
         {
            _loc5_ = 0;
            while(_loc5_ < param1[_loc4_].length)
            {
               _loc8_ = new AoJianFeiShengPanelRender();
               _loc8_.x = _loc4_ * 160 + 30;
               _loc8_.y = _loc5_ * 90 + 20;
               this.boxContainer.addChild(_loc8_);
               _loc8_.setData(param1[_loc4_][_loc5_]);
               _loc5_++;
            }
            _loc6_ = new Goods(param2[_loc4_].goodsID);
            _loc7_ = new SecondButton();
            _loc7_.label = _loc6_.res.name + "*" + param2[_loc4_].goodsNum + "（领取）";
            _loc7_.x = _loc4_ * 160 + 20;
            _loc7_.y = 290;
            _loc7_.name = _loc4_ + "";
            _loc7_.enabled = Boolean(param2[_loc4_].canRecieved);
            this.boxContainer.addChild(_loc7_);
            _loc7_.addEventListener(MouseEvent.CLICK,this.onClickLingQuHandler);
            _loc4_++;
         }
         this.dataArr[0].setButtonEnabled(Boolean(param3.tag1));
         this.dataArr[1].setButtonEnabled(Boolean(param3.tag2));
      }
      
      private function initDuiHuanView() : void
      {
         var _loc1_:Object = null;
         var _loc2_:AoJianFeiShengDuiHuanRender = null;
         _loc1_ = new Object();
         _loc1_.miaoShu = "每200个Boss令可兑换一个飞升经验丹";
         _loc1_.shuoming = "【每天限制兑换一个】";
         _loc1_.index = 3;
         _loc2_ = new AoJianFeiShengDuiHuanRender();
         _loc2_.$parent = this;
         _loc2_.setData(_loc1_);
         _loc2_.x = 500;
         _loc2_.y = 20;
         addChild(_loc2_);
         this.dataArr.push(_loc2_);
         _loc1_ = new Object();
         _loc1_.miaoShu = "玩家可使用15颗仙魔经验丹兑换飞升经验丹";
         _loc1_.shuoming = "【每天限制兑换一个】";
         _loc1_.index = 4;
         _loc2_ = new AoJianFeiShengDuiHuanRender();
         _loc2_.$parent = this;
         _loc2_.setData(_loc1_);
         _loc2_.x = 500;
         _loc2_.y = 150;
         addChild(_loc2_);
         this.dataArr.push(_loc2_);
      }
      
      private function onClickLingQuHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(AoJianFeiShengPanel.AOJIANFEISHENG_LINGQU_CLICK,"",int(param1.currentTarget.name)));
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
   }
}

