package com.tgame.shell.view.components.duixueren
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class DuiXueRen_MapXueRen extends FPanel
   {
      
      public var _parent:DisplayObject;
      
      private var boxContainer:Sprite;
      
      private var itemContainer:Sprite;
      
      private var id:int = 0;
      
      public function DuiXueRen_MapXueRen()
      {
         super();
         this.titleText = LanResManager.getLanCommonTextWords("十二月活动");
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 275;
         height = 260;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setDuiXueRenMapData(param1:Object, param2:int, param3:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:FLabel = null;
         var _loc7_:SecondButton = null;
         this.removeContainerBoxChildren();
         this.id = param2;
         this.titleText = param3 + LanResManager.getLanCommonTextWords("的雪人");
         _loc4_ = 0;
         for each(_loc5_ in param1)
         {
            _loc6_ = new FLabel();
            _loc6_.textColor = StaticValue.WHITE;
            _loc6_.filters = StaticValue.filter;
            _loc6_.x = 90;
            _loc6_.y = 40 * _loc4_ + 25;
            this.boxContainer.addChild(_loc6_);
            switch(_loc4_)
            {
               case 0:
                  _loc6_.text = this.getBodyPositionByIndex(_loc4_) + "  " + param1.axueQiu + "/10";
                  break;
               case 1:
                  _loc6_.text = this.getBodyPositionByIndex(_loc4_) + "  " + param1.byanJing + "/10";
                  break;
               case 2:
                  _loc6_.text = this.getBodyPositionByIndex(_loc4_) + "  " + param1.cbiZi + "/10";
                  break;
               case 3:
                  _loc6_.text = this.getBodyPositionByIndex(_loc4_) + "  " + param1.dmaoZi + "/10";
                  break;
               case 4:
                  _loc6_.text = this.getBodyPositionByIndex(_loc4_) + "  " + param1.emaoJing + "/10";
            }
            _loc7_ = new SecondButton();
            _loc7_.label = LanResManager.getLanCommonTextWords("提交");
            _loc7_.x = 210;
            _loc7_.y = 40 * _loc4_ + 25;
            _loc7_.name = _loc4_ + 1 + "";
            this.boxContainer.addChild(_loc7_);
            _loc7_.addEventListener(MouseEvent.CLICK,this.onClickHandler);
            _loc4_++;
         }
         this.duiXueRenGoodsChangeHandler();
      }
      
      public function duiXueRenGoodsChangeHandler() : void
      {
         var _loc2_:Goods = null;
         var _loc3_:int = 0;
         var _loc4_:ItemFace = null;
         this.removeContainerItemChildren();
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            _loc2_ = new Goods(this.getGoodsIDByIndex(_loc1_));
            _loc3_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.getGoodsIDByIndex(_loc1_),true);
            _loc2_.count = _loc3_;
            _loc4_ = new ItemFace(_loc2_);
            _loc4_.x = 20;
            _loc4_.y = 40 * _loc1_ + 10;
            this.itemContainer.addChild(_loc4_);
            _loc1_++;
         }
      }
      
      private function getGoodsIDByIndex(param1:int) : int
      {
         switch(param1)
         {
            case 0:
               return 47569;
            case 1:
               return 47570;
            case 2:
               return 47571;
            case 3:
               return 47572;
            case 4:
               return 47573;
            default:
               return 0;
         }
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:Object = new Object();
         _loc2_.id = this.id;
         _loc2_.index = int(param1.currentTarget.name);
         this._parent.dispatchEvent(new BaseEvent(MainUI.DUIXUEREN_BTN_TIJIAO_CLICK,"",_loc2_));
      }
      
      private function getBodyPositionByIndex(param1:int) : String
      {
         switch(param1)
         {
            case 0:
               return LanResManager.getLanCommonTextWords("雪    球");
            case 1:
               return LanResManager.getLanCommonTextWords("雪人眼睛");
            case 2:
               return LanResManager.getLanCommonTextWords("雪人鼻子");
            case 3:
               return LanResManager.getLanCommonTextWords("雪人帽子");
            case 4:
               return LanResManager.getLanCommonTextWords("雪人围巾");
            default:
               return "";
         }
      }
      
      private function removeContainerBoxChildren() : void
      {
         while(this.boxContainer.numChildren > 0)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
      
      private function removeContainerItemChildren() : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
      }
   }
}

