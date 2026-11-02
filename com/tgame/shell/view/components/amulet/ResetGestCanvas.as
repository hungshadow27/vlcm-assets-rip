package com.tgame.shell.view.components.amulet
{
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.shell.view.components.AmuletPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ResetGestCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var bg:Bitmap;
      
      private var ft1:FTextArea;
      
      private var startBtn:SecondButton;
      
      private var putBtn:SmallButton;
      
      private var it1:ItemFace;
      
      private var it2:ItemFace;
      
      private var it3:ItemFace;
      
      private var materialContainer:Sprite;
      
      private var checkBox:FCheckBox;
      
      private var selectBtn:FSimpleButton;
      
      private var count:FLabel;
      
      private var listContainer:FCanvas;
      
      private var scroll:FVScorllBar;
      
      private var countList:FList;
      
      private var itemContainer:Sprite;
      
      private var luckMaterial:Goods;
      
      private var tempCount:int;
      
      private var helpBtn:FSimpleButton;
      
      public function ResetGestCanvas()
      {
         var ft:FTextArea;
         var lb:FLabel;
         var img:Bitmap = null;
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.amulet.kungfu.reset.ui";
         addChild(this.bg);
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanTextWords(this,"放入舍利");
         addChild(this.putBtn);
         this.putBtn.x = 7;
         this.putBtn.y = 10;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         ft = new FTextArea();
         with(ft)
         {
            x = 71;
            y = 12;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"武功类型重置步骤说明",[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,StaticValue.GREEN_HTML,StaticValue.WHITE_HTML],false) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 71;
            y = 97;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"重置成功后舍利子加成的武功层数不变",[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML],false) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 34;
            y = 194;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"武功层数加成不变，重新生成武功类型",[],false) + "</textformat>";
         }
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.amulet.text.jinglianshi");
         addChild(img);
         img.x = 7;
         img.y = 220;
         img = StaticValue.getBitmapByClassName("ui.amulet.text.luckstone");
         addChild(img);
         img.x = 66;
         img.y = 220;
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 114;
            y = 220;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"本次操作消耗精炼石");
         }
         addChild(this.ft1);
         this.itemContainer = new Sprite();
         addChild(this.itemContainer);
         this.itemContainer.x = 16;
         this.itemContainer.y = 41;
         this.materialContainer = new Sprite();
         addChild(this.materialContainer);
         this.materialContainer.x = 15;
         this.materialContainer.y = 248;
         lb = new FLabel();
         with(lb)
         {
            x = 128;
            y = 272;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"本次操作使用个幸运晶");
         }
         addChild(lb);
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 107;
         this.checkBox.y = 271;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.selectBtn = new FSimpleButton();
         this.selectBtn.skin = "bottomButton";
         addChild(this.selectBtn);
         this.selectBtn.x = 227;
         this.selectBtn.y = 271;
         this.selectBtn.enabled = false;
         this.selectBtn.addEventListener(MouseEvent.CLICK,this.onShowList);
         this.count = new FLabel();
         with(this.count)
         {
            x = 210;
            y = 271;
            textColor = StaticValue.WHITE;
            text = "1";
         }
         addChild(this.count);
         this.listContainer = new FCanvas();
         this.listContainer.skin = "backGroud";
         addChild(this.listContainer);
         this.listContainer.x = 207;
         this.listContainer.y = 290;
         this.listContainer.visible = false;
         this.countList = new FList();
         this.countList.listWidth = 16;
         this.countList.x = 3;
         this.countList.y = 2;
         this.countList.dataProvider = <list>
														<node label="0"/>
													</list>;
         this.listContainer.addChild(this.countList);
         this.countList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.listContainer.width = this.countList.width + 6;
         this.listContainer.height = 78;
         this.setListCount(9);
         this.scroll = new FVScorllBar(this.countList,74);
         this.listContainer.addChild(this.scroll);
         this.scroll.x = 22;
         this.scroll.y = 2;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始重置");
         addChild(this.startBtn);
         this.startBtn.x = (307 - this.startBtn.width) / 2;
         this.startBtn.y = 310;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.helpBtn = new FSimpleButton();
         this.helpBtn.skin = "helpBtn";
         addChild(this.helpBtn);
         this.helpBtn.x = 20;
         this.helpBtn.y = 309;
         this.helpBtn.addEventListener(MouseEvent.CLICK,this.showHelp);
         this.helpBtn.visible = false;
      }
      
      private function showHelp(param1:MouseEvent) : void
      {
         if(HelpManager.getVisable(HelpManager.UI_HELP_TYPE_KUNGFU_RESET))
         {
            HelpManager.hideHelp(HelpManager.UI_HELP_TYPE_KUNGFU_RESET);
         }
         else
         {
            HelpManager.showHelp(this.$parent,HelpManager.UI_HELP_TYPE_KUNGFU_RESET);
         }
      }
      
      private function setListCount(param1:int) : void
      {
         var _loc2_:int = 0;
         param1 = param1 > 9 ? 9 : param1;
         var _loc3_:XML = <list></list>;
         _loc2_ = 1;
         while(_loc2_ < param1 + 1)
         {
            _loc3_.appendChild(<node label={_loc2_}/>);
            _loc2_++;
         }
         this.countList.dataProvider = _loc3_;
      }
      
      private function onShowList(param1:MouseEvent) : void
      {
         this.listContainer.visible = !this.listContainer.visible;
      }
      
      private function onListClick(param1:MouseEvent) : void
      {
         this.count.text = this.countList.selectItem.label;
         this.listContainer.visible = false;
         this.tempCount = int(this.countList.selectItem.label);
         if(Boolean(this.luckMaterial) && this.luckMaterial.count < this.tempCount)
         {
            this.tempCount = this.luckMaterial.count;
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("很抱歉，您的背包中只有") + this.tempCount + LanResManager.getLanCommonTextWords("个幸运晶") + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，您的背包中只有") + this.tempCount + LanResManager.getLanCommonTextWords("个幸运晶"));
            this.count.text = "" + this.tempCount;
            this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":this.tempCount,
               "isSetMaterial":false
            }));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":this.tempCount,
               "isSetMaterial":true
            }));
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         if(this.itemContainer.numChildren == 0)
         {
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请先放入材料") + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请先放入材料"));
            this.checkBox.selectState = false;
            this.count.text = "1";
            return;
         }
         this.selectBtn.enabled = this.checkBox.selectState;
         if(!this.checkBox.selectState)
         {
            this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":0,
               "isSetMaterial":false
            }));
            this.count.text = "1";
            this.listContainer.visible = false;
         }
         else if(Boolean(this.luckMaterial) && this.luckMaterial.count > 0)
         {
            this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
               "num":1,
               "isSetMaterial":true
            }));
         }
         else
         {
            FAlert.show("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("很抱歉，您的背包中没有幸运晶，无法提升成功几率") + "</font>");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，您的背包中没有幸运晶，无法提升成功几率"));
            this.checkBox.selectState = false;
            this.selectBtn.enabled = false;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               if(this.putBtn.label == LanResManager.getLanCommonTextWords("取出舍利"))
               {
                  this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_PANEL_MAKE_GET_STONE));
               }
               else
               {
                  this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_PANEL_MAKE_PUT_STONE));
               }
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_PANEL_MAKE_START));
         }
      }
      
      public function setShelizi(param1:Goods = null) : void
      {
         while(this.itemContainer.numChildren > 0)
         {
            this.itemContainer.removeChildAt(0);
         }
         if(param1)
         {
            this.it1 = new ItemFace(param1);
            this.itemContainer.addChild(this.it1);
            this.it1.x = 0;
            this.it1.y = 0;
            this.putBtn.label = LanResManager.getLanCommonTextWords("取出舍利");
         }
         else
         {
            this.putBtn.label = LanResManager.getLanCommonTextWords("放入舍利");
            this.setMaterial();
         }
      }
      
      public function setData(param1:int, param2:Boolean, param3:int, param4:Boolean, param5:int) : void
      {
         var _loc6_:String = "";
         var _loc7_:String = "";
         if(param2)
         {
            _loc6_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1 + "</font>";
         }
         else
         {
            _loc6_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font>";
         }
         if(param4)
         {
            _loc7_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param3 + "</font>";
         }
         else
         {
            _loc7_ = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + "</font>";
         }
         this.ft1.htmlText = "<textformat leading=\'0\'>" + LanResManager.getLanTextWords(this,"本次操作消耗铜币",[_loc6_,_loc7_,param5]) + "</textformat>";
      }
      
      public function setMaterial(param1:Goods = null, param2:Goods = null) : void
      {
         var _loc3_:ItemFace = null;
         this.luckMaterial = param2;
         while(this.materialContainer.numChildren > 0)
         {
            this.materialContainer.removeChildAt(0);
         }
         if(param1)
         {
            _loc3_ = new ItemFace(param1);
            this.materialContainer.addChild(_loc3_);
            _loc3_.x = 0;
            if(param1.count != 0)
            {
               _loc3_.filters = [];
            }
            else
            {
               _loc3_.filters = Tools.blackWhiteFilter;
            }
         }
         if(param2)
         {
            _loc3_ = new ItemFace(param2);
            this.materialContainer.addChild(_loc3_);
            _loc3_.x = 53;
            if(param2.count != 0)
            {
               _loc3_.filters = [];
               this.checkBox.enabled = true;
               this.setListCount(param2.count);
               if(this.tempCount > param2.count)
               {
                  this.count.text = "" + param2.count;
               }
               this.tempCount = this.checkBox.selectState ? int(this.count.text) : 0;
               this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
                  "num":this.tempCount,
                  "isSetMaterial":true
               }));
            }
            else
            {
               _loc3_.filters = Tools.blackWhiteFilter;
               this.tempCount = 0;
               this.checkBox.selectState = false;
               this.checkBox.enabled = false;
               this.count.text = "1";
               this.listContainer.visible = false;
               this.selectBtn.enabled = false;
               this.$parent.dispatchEvent(new BaseEvent(AmuletPanel.UI_RESERGEST_MATERIALSYNTHESIZE_USE_LUCKSTONE_COUNT,"",{
                  "num":this.tempCount,
                  "isSetMaterial":false
               }));
            }
         }
         else
         {
            this.checkBox.selectState = false;
            this.selectBtn.enabled = false;
            this.count.text = "1";
         }
      }
      
      public function reset() : void
      {
         this.setShelizi();
         this.setData(0,false,0,false,0);
         this.setMaterial();
         this.count.text = "1";
         this.checkBox.selectState = false;
         this.selectBtn.enabled = false;
      }
   }
}

