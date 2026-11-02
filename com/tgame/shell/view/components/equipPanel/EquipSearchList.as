package com.tgame.shell.view.components.equipPanel
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class EquipSearchList extends FPanel
   {
      
      private var txtName:FLabel;
      
      private var txtLeft:FLabel;
      
      private var txtInput:FTextInput;
      
      private var searchBtn:FSimpleButton;
      
      private var xieXiaBtn:SmallButton;
      
      private var rankList:FList;
      
      private var listScroll:FVScorllBar;
      
      private var selectGoods:Goods;
      
      public function EquipSearchList()
      {
         var _loc1_:FCanvas = null;
         super();
         this.width = 295;
         this.height = 430;
         this.titleText = "Trang bị";
         closeBtn.visible = true;
         closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         addChild(_loc1_);
         _loc1_.width = 259;
         _loc1_.height = 325;
         _loc1_.x = 18;
         _loc1_.y = 52;
         this.txtName = new FLabel();
         this.txtName.textColor = StaticValue.WHITE;
         this.txtName.filters = StaticValue.filter;
         this.txtName.x = 17;
         this.txtName.y = 6;
         addChild(this.txtName);
         this.txtName.text = "Người chơi: " + GameInstance.mainChar.name;
         this.txtLeft = new FLabel();
         this.txtLeft.textColor = StaticValue.WHITE;
         this.txtLeft.filters = StaticValue.filter;
         this.txtLeft.x = 17;
         this.txtLeft.y = 26;
         addChild(this.txtLeft);
         this.txtLeft.text = "Tìm kiếm:";
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         addChild(_loc1_);
         _loc1_.width = 135;
         _loc1_.height = 20;
         _loc1_.x = 73;
         _loc1_.y = 26;
         this.txtInput = new FTextInput();
         this.txtInput.textColor = StaticValue.WHITE;
         this.txtInput.filters = StaticValue.filter;
         this.txtInput.width = 135;
         this.txtInput.height = 20;
         this.txtInput.x = 73;
         this.txtInput.y = 26;
         this.txtInput.text = "";
         addChild(this.txtInput);
         this.searchBtn = new FSimpleButton();
         this.searchBtn.skin = "searchButton";
         addChild(this.searchBtn);
         this.searchBtn.x = 211;
         this.searchBtn.y = 27;
         this.searchBtn.addEventListener(MouseEvent.CLICK,this.onClickSearch);
         this.xieXiaBtn = new SmallButton();
         this.xieXiaBtn.label = "Tháo ra";
         addChild(this.xieXiaBtn);
         this.xieXiaBtn.x = 233;
         this.xieXiaBtn.y = 26;
         this.xieXiaBtn.addEventListener(MouseEvent.CLICK,this.onXieXia);
         this.rankList = new FList();
         this.rankList.skin = "list";
         this.rankList.itemRenderer = new EquipSearchListRenderer();
         this.rankList.listWidth = 240;
         this.rankList.listHeight = 323;
         this.rankList.x = 18;
         this.rankList.y = 54;
         addChild(this.rankList);
         this.rankList.addEventListener(MouseEvent.CLICK,this.onClickHadler);
         this.listScroll = new FVScorllBar(this.rankList,320);
         addChild(this.listScroll);
         this.listScroll.x = 260;
         this.listScroll.y = 54;
         this.listScroll.update();
      }
      
      private function onClickHadler(param1:MouseEvent) : void
      {
         this.selectGoods = this.rankList.selectItem as Goods;
      }
      
      private function onXieXia(param1:MouseEvent) : void
      {
         if(this.selectGoods)
         {
            GameInstance.uiInstance.charAttribute.dispatchEvent(new BaseEvent(CharAttribute.EQUIP_SEARCH_UNLOAD,"",this.selectGoods));
         }
      }
      
      private function onClickSearch(param1:MouseEvent) : void
      {
         this.selectGoods = null;
         this.rankList.dataProvider = this.setEquipData();
         this.listScroll.update();
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(this.visible)
         {
            this.visible = false;
         }
      }
      
      private function setEquipData() : Array
      {
         var input:String = null;
         var filteredArray:Array = null;
         var all:Array = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         input = this.txtInput.text;
         if(input)
         {
            filteredArray = all.filter(function(param1:*, param2:int, param3:Array):Boolean
            {
               return input != "" && param1.res.name.indexOf(input) != -1;
            });
         }
         else
         {
            filteredArray = all;
         }
         return filteredArray;
      }
   }
}

