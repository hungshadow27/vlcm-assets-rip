package com.tgame.shell.view.components.team
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class CombinationSelect extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var _studys:Array;
      
      private var xml:XML;
      
      public var orderList:FList;
      
      private var okBtn:SmallButton;
      
      private var orderName:FLabel;
      
      private var study:FLabel;
      
      private var open:FLabel;
      
      private var effect:FLabel;
      
      private var other:FTextArea;
      
      private var orderImg:DisplayObject;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var fc3:FCanvas;
      
      private var fc4:FCanvas;
      
      private var fc5:FCanvas;
      
      public function CombinationSelect()
      {
         var xmlStr:String;
         var lb:FLabel;
         var bg:Bitmap = null;
         this._studys = [];
         super();
         xmlStr = LanResManager.getLanTextWords(this,"xml赋值阵法");
         this.xml = XML(xmlStr);
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 576;
         height = 420;
         titleText = LanResManager.getLanCommonTextWords("阵法选择");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = StaticValue.getBitmapByClassName("ui.team.combination.txt");
         addChild(bg);
         bg.x = 60;
         bg.y = 8;
         this.fc1 = new FCanvas();
         this.fc1.x = 10;
         this.fc1.y = 29;
         this.fc1.width = 165;
         this.fc1.height = 315;
         this.fc1.skin = "box";
         addChild(this.fc1);
         this.fc2 = new FCanvas();
         this.fc2.x = 174;
         this.fc2.y = 0;
         this.fc2.width = 392;
         this.fc2.height = 30;
         this.fc2.skin = "box_transparence";
         addChild(this.fc2);
         this.fc3 = new FCanvas();
         this.fc3.x = 10;
         this.fc3.y = 0;
         this.fc3.width = 165;
         this.fc3.height = 30;
         this.fc3.skin = "box_transparence";
         addChild(this.fc3);
         this.fc4 = new FCanvas();
         this.fc4.x = 174;
         this.fc4.y = 29;
         this.fc4.width = 392;
         this.fc4.height = 315;
         this.fc4.skin = "box";
         addChild(this.fc4);
         this.fc5 = new FCanvas();
         this.fc5.x = 176;
         this.fc5.y = 161;
         this.fc5.width = 388;
         this.fc5.height = 183;
         this.fc5.skin = "box_transparence";
         addChild(this.fc5);
         this.orderList = new FList();
         this.orderList.skin = "list";
         this.orderList.itemRenderer = new OrderListRender();
         this.orderList.listWidth = 145;
         this.orderList.listHeight = 275;
         addChild(this.orderList);
         this.orderList.x = 23;
         this.orderList.y = 38;
         this.orderList.dataProvider = this.xml;
         this.orderList.setSelectItemByIndex(0);
         this.orderList.addEventListener(MouseEvent.CLICK,this.onList);
         this.okBtn = new SmallButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"开启此阵");
         this.okBtn.toolTip = LanResManager.getLanTextWords(this,"开启此阵1",[StaticValue.GREEN_HTML]);
         addChild(this.okBtn);
         this.okBtn.x = 440;
         this.okBtn.y = 7;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onOK);
         lb = new FLabel();
         with(lb)
         {
            x = 262;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"阵法名称");
         addChild(lb);
         this.orderName = new FLabel();
         with(this.orderName)
         {
            x = 330;
            y = 5;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = orderList.selectItem.label;
         }
         addChild(this.orderName);
         lb = new FLabel();
         with(lb)
         {
            x = 180;
            y = 48;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"阵法学习条件");
         addChild(lb);
         this.study = new FLabel();
         with(this.study)
         {
            x = 262;
            y = 48;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = orderList.selectItem.study;
         }
         addChild(this.study);
         lb = new FLabel();
         with(lb)
         {
            x = 180;
            y = 68;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"阵法开启限制");
         addChild(lb);
         this.open = new FLabel();
         with(this.open)
         {
            x = 262;
            y = 68;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = orderList.selectItem.open;
         }
         addChild(this.open);
         lb = new FLabel();
         with(lb)
         {
            x = 180;
            y = 88;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"阵法开启后效果");
         addChild(lb);
         this.effect = new FLabel();
         with(this.effect)
         {
            x = 240;
            y = 88;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = orderList.selectItem.effect;
         }
         addChild(this.effect);
         lb = new FLabel();
         with(lb)
         {
            x = 180;
            y = 108;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"其他说明");
         addChild(lb);
         this.other = new FTextArea();
         with(this.other)
         {
            x = 238;
            y = 108;
            width = 290;
            height = 55;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = orderList.selectItem.other;
         }
         addChild(this.other);
      }
      
      private function onList(param1:MouseEvent = null) : void
      {
         if(this.orderList.selectItem.isopen == "1")
         {
            this.study.textColor = StaticValue.WHITE;
         }
         else
         {
            this.study.textColor = StaticValue.RED;
         }
         this.orderName.text = this.orderList.selectItem.label;
         this.study.text = this.orderList.selectItem.study;
         this.open.text = this.orderList.selectItem.open;
         this.effect.text = this.orderList.selectItem.effect;
         this.other.text = this.orderList.selectItem.other;
         if(this._studys.indexOf(int(this.orderList.selectItem.id)) == -1)
         {
            this.okBtn.enabled = false;
         }
         else
         {
            this.okBtn.enabled = true;
         }
         if(Boolean(this.orderImg) && Boolean(this.orderImg.parent))
         {
            this.orderImg.parent.removeChild(this.orderImg);
         }
         this.orderImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/" + this.orderList.selectItem.id + ".jpg",384,177);
         addChild(this.orderImg);
         this.orderImg.x = 178;
         this.orderImg.y = 164;
      }
      
      private function onOK(param1:MouseEvent) : void
      {
         var _loc2_:int = int(this.orderList.selectItem.id);
         EventDispatchCenter.getInstance().dispatchEvent(new BaseEvent(TeamPanel.UI_TEAMPANEL_MYTEAM_ORDER_USE,"",_loc2_));
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function set studys(param1:Array) : void
      {
         var _loc3_:int = 0;
         this._studys = param1;
         var _loc2_:XMLList = this.xml.children();
         var _loc4_:int = _loc2_.length();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this._studys.indexOf(int(_loc2_[_loc3_].@id)) != -1)
            {
               _loc2_[_loc3_].@isopen = "1";
            }
            _loc3_++;
         }
         this.orderList.dataProvider = this.xml;
         this.orderList.setSelectItemByIndex(0);
         this.onList();
      }
   }
}

