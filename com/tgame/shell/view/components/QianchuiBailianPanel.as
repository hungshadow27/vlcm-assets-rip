package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ride.QianchuiBailianListRender;
   import com.tgame.shell.view.components.ride.StrengthenListRender;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class QianchuiBailianPanel extends FPanel
   {
      
      public static const UI_QIANCHUIBAILIAN_SET_ZHUANGBEI_CLICK:String = "UI_QIANCHUIBAILIAN_SET_ZHUANGBEI_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_GET_ZHUANGBEI_CLICK:String = "UI_QIANCHUIBAILIAN_GET_ZHUANGBEI_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_GOUMAI_GOODS_CLICK:String = "UI_QIANCHUIBAILIAN_GOUMAI_GOODS_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_ZIDONG_CLICK:String = "UI_QIANCHUIBAILIAN_ZIDONG_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_XULI_CLICK:String = "UI_QIANCHUIBAILIAN_XULI_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_XUANZHEXIANG_CLICK:String = "UI_QIANCHUIBAILIAN_XUANZHEXIANG_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_XUANZHECHUI_CLICK:String = "UI_QIANCHUIBAILIAN_XUANZHECHUI_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_LINGQU_JINGYAN_CLICK:String = "UI_QIANCHUIBAILIAN_LINGQU_JINGYAN_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_HUANJIANGLI_CLICK:String = "UI_QIANCHUIBAILIAN_HUANJIANGLI_CLICK";
      
      public static const UI_QIANCHUIBAILIAN_LINGQU_ZHENZI_CLICK:String = "UI_QIANCHUIBAILIAN_LINGQU_ZHENZI_CLICK";
      
      private var xuliBtn:FSimpleButton;
      
      private var fta:FTextArea;
      
      private var nameFta:FTextArea;
      
      private var shuxingFta:FTextArea;
      
      private var goodsFta:FTextArea;
      
      private var jiangliFta:FTextArea;
      
      private var selectGrade1:FLabel;
      
      private var selectBtn1:FSimpleButton;
      
      private var listContainer1:FCanvas;
      
      private var selectList1:FList;
      
      private var selectGrade2:FLabel;
      
      private var selectBtn2:FSimpleButton;
      
      private var listContainer2:FCanvas;
      
      private var selectList2:FList;
      
      private var fangruBtn:SecondButton;
      
      private var goumaiBtn:SecondButton;
      
      private var zidongBtn:SecondButton;
      
      private var jilvBar:ColorBar;
      
      private var item1:ItemFace;
      
      private var item2:ItemFace;
      
      private var fuzeng:QianchuiBailianFuzengPanel;
      
      private var qianchuibailianyouhaoduPanel:QianchuiBailianYouhaoduPanel;
      
      private var mc:MovieClip;
      
      public function QianchuiBailianPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         super();
         skin = "panel";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = true;
         width = 392;
         height = 363;
         titleText = LanResManager.getLanCommonTextWords("千锤百炼");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.qianchuibailian.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 52;
            y = 8;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"宝剑锋从磨砺出，梅花香自苦寒来");
         }
         addChild(this.fta);
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.stop();
            this.mc.parent.removeChild(this.mc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            mc = _loc2_.content as MovieClip;
            mc.x = 90 - mc.width / 2;
            mc.y = 170 - mc.height / 2;
            addChild(mc);
            mc.stop();
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/qianchuibailian/qichui.swf");
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 193;
            y = 67;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("选择锻造项");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 193;
            y = 91;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("选择锻造锤");
         }
         addChild(this.fta);
         this.selectGrade1 = new FLabel();
         with(this.selectGrade1)
         {
            x = 155 + 82 + 32 + 10;
            y = 12 + 55;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("提升强化星数");
         }
         addChild(this.selectGrade1);
         this.selectBtn1 = new FSimpleButton();
         this.selectBtn1.skin = "bottomButton";
         addChild(this.selectBtn1);
         this.selectBtn1.x = 354;
         this.selectBtn1.y = 68;
         this.selectBtn1.addEventListener(MouseEvent.CLICK,this.showSelectList);
         this.selectGrade2 = new FLabel();
         with(this.selectGrade2)
         {
            x = 279;
            y = 90;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("紫品神锻锤");
         }
         addChild(this.selectGrade2);
         this.selectBtn2 = new FSimpleButton();
         this.selectBtn2.skin = "bottomButton";
         addChild(this.selectBtn2);
         this.selectBtn2.x = 354;
         this.selectBtn2.y = 91;
         this.selectBtn2.addEventListener(MouseEvent.CLICK,this.showSelectList2);
         this.selectBtn2.enabled = false;
         this.nameFta = new FTextArea();
         with(this.nameFta)
         {
            x = 193;
            y = 113;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.PURPLE50;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("紫品神锻锤");
         }
         addChild(this.nameFta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 193;
            y = 129;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("锻造成功几率：");
         }
         addChild(this.fta);
         this.jilvBar = new ColorBar(1,62,5,true,true);
         addChild(this.jilvBar);
         this.jilvBar.x = 307;
         this.jilvBar.y = 137;
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 209;
            y = 153;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("锻造附赠奖励：");
         }
         this.jiangliFta = new FTextArea();
         with(this.jiangliFta)
         {
            x = 290;
            y = 153;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         this.listContainer1 = new FCanvas();
         this.listContainer1.skin = "backGroud";
         this.listContainer1.x = 274;
         this.listContainer1.y = 85;
         addChild(this.listContainer1);
         this.listContainer1.visible = false;
         this.selectList1 = new FList();
         this.selectList1.skin = "list";
         this.selectList1.listWidth = 82;
         this.selectList1.x = 5;
         this.selectList1.y = 2;
         this.selectList1.itemRenderer = new StrengthenListRender();
         this.selectList1.dataProvider = <list>
														<node label={LanResManager.getLanCommonTextWords("提升强化星数")} id="0"/>
														<node label={LanResManager.getLanCommonTextWords("提升附加属性")} id="1"/>
													</list>;
         this.listContainer1.addChild(this.selectList1);
         this.selectList1.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.listContainer1.width = this.selectList1.width + 10;
         this.listContainer1.height = this.selectList1.height + 4;
         this.listContainer2 = new FCanvas();
         this.listContainer2.skin = "backGroud";
         this.listContainer2.x = 274;
         this.listContainer2.y = 108;
         addChild(this.listContainer2);
         this.listContainer2.visible = false;
         this.selectList2 = new FList();
         this.selectList2.skin = "list";
         this.selectList2.listWidth = 82;
         this.selectList2.x = 5;
         this.selectList2.y = 2;
         this.selectList2.itemRenderer = new QianchuiBailianListRender();
         this.selectList2.dataProvider = <list>
														<node label={LanResManager.getLanCommonTextWords("普品天机锤")} id="0" col="0Xffffff"/>
														<node label={LanResManager.getLanCommonTextWords("蓝品锻造锤")} id="1" col="0X1e90ff"/>
														<node label={LanResManager.getLanCommonTextWords("绿品锻造锤")} id="2" col="0X00ff00"/>
														<node label={LanResManager.getLanCommonTextWords("紫品神锻锤")} id="3" col="0x9933fa"/>
													</list>;
         this.listContainer2.addChild(this.selectList2);
         this.selectList2.addEventListener(MouseEvent.CLICK,this.onSelect2);
         this.listContainer2.width = this.selectList2.width + 10;
         this.listContainer2.height = this.selectList2.height + 4;
         this.fangruBtn = new SecondButton();
         this.fangruBtn.label = LanResManager.getLanCommonTextWords("放入装备");
         addChild(this.fangruBtn);
         this.fangruBtn.x = 70;
         this.fangruBtn.y = 225;
         this.fangruBtn.addEventListener(MouseEvent.CLICK,this.onSetItem);
         this.goodsFta = new FTextArea();
         with(this.goodsFta)
         {
            x = 200;
            y = 173;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("紫品神锻锤");
         }
         addChild(this.goodsFta);
         this.goumaiBtn = new SecondButton();
         this.goumaiBtn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(this.goumaiBtn);
         this.goumaiBtn.x = 210;
         this.goumaiBtn.y = 235;
         this.goumaiBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.goumaiBtn.visible = false;
         this.xuliBtn = new FSimpleButton();
         this.xuliBtn.skin = "qianchuibailian_xuliBtn";
         addChild(this.xuliBtn);
         this.xuliBtn.x = 315;
         this.xuliBtn.y = 190;
         this.xuliBtn.addEventListener(MouseEvent.CLICK,this.xuliClick);
         this.zidongBtn = new SecondButton();
         this.zidongBtn.label = LanResManager.getLanCommonTextWords("自动锻造");
         addChild(this.zidongBtn);
         this.zidongBtn.x = 282;
         this.zidongBtn.y = 235;
         this.zidongBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.shuxingFta = new FTextArea();
         with(this.shuxingFta)
         {
            x = 30;
            y = 265;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"提升强化星数：锻造成功将会随机提升装备的强化星数3");
         }
         addChild(this.shuxingFta);
         this.fuzeng = new QianchuiBailianFuzengPanel();
         this.fuzeng.$parent = this;
         this.fuzeng.x = this.width;
         this.fuzeng.y = -34;
      }
      
      private function xuliClick(param1:MouseEvent) : void
      {
         if(this.mc)
         {
            this.mc.play();
         }
         dispatchEvent(new BaseEvent(UI_QIANCHUIBAILIAN_XULI_CLICK,"",1));
      }
      
      private function onSetItem(param1:MouseEvent) : void
      {
         if(this.fangruBtn.label == LanResManager.getLanCommonTextWords("放入装备"))
         {
            dispatchEvent(new BaseEvent(UI_QIANCHUIBAILIAN_SET_ZHUANGBEI_CLICK));
         }
         else
         {
            dispatchEvent(new BaseEvent(UI_QIANCHUIBAILIAN_GET_ZHUANGBEI_CLICK));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.goumaiBtn:
               dispatchEvent(new BaseEvent(UI_QIANCHUIBAILIAN_GOUMAI_GOODS_CLICK));
               break;
            case this.zidongBtn:
               if(this.zidongBtn.label == LanResManager.getLanCommonTextWords("自动锻造"))
               {
                  dispatchEvent(new BaseEvent(UI_QIANCHUIBAILIAN_ZIDONG_CLICK,"",false));
               }
               else
               {
                  dispatchEvent(new BaseEvent(UI_QIANCHUIBAILIAN_ZIDONG_CLICK,"",true));
               }
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.stop();
            this.mc.parent.removeChild(this.mc);
         }
         if(this.qianchuibailianyouhaoduPanel != null && this.qianchuibailianyouhaoduPanel.parent != null)
         {
            this.qianchuibailianyouhaoduPanel.parent.removeChild(this.qianchuibailianyouhaoduPanel);
         }
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         this.listContainer1.visible = !this.listContainer1.visible;
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         var _loc2_:BaseEvent = null;
         this.selectGrade1.text = this.selectList1.selectItem.label;
         this.listContainer1.visible = false;
         _loc2_ = new BaseEvent(UI_QIANCHUIBAILIAN_XUANZHEXIANG_CLICK,"",this.selectList1.selectItem.id);
         dispatchEvent(_loc2_);
         if(this.selectList1.selectItem.id == 0)
         {
            this.shuxingFta.htmlText = LanResManager.getLanTextWords(this,"提升强化星数：锻造成功将会随机提升装备的强化星数3");
         }
         else
         {
            this.shuxingFta.htmlText = LanResManager.getLanTextWords(this,"提升附加属性：锻造成功将会提升装备每条附加属性的数值");
         }
      }
      
      private function showSelectList2(param1:MouseEvent) : void
      {
         this.listContainer2.visible = !this.listContainer2.visible;
      }
      
      private function onSelect2(param1:MouseEvent) : void
      {
         var _loc2_:BaseEvent = null;
         this.selectGrade2.text = this.selectList2.selectItem.label;
         this.selectGrade2.textColor = this.selectList2.selectItem.col;
         this.listContainer2.visible = false;
         _loc2_ = new BaseEvent(UI_QIANCHUIBAILIAN_XUANZHECHUI_CLICK,"",this.selectList2.selectItem.id);
         dispatchEvent(_loc2_);
      }
      
      public function SetInitialize(param1:Boolean, param2:int) : void
      {
         var bo1:Boolean = param1;
         var int1:int = param2;
         var bo:Boolean = true;
         this.selectBtn1.enabled = bo;
         this.zidongBtn.enabled = bo;
         this.xuliBtn.skin = "qianchuibailian_xuliBtn";
         if(int1 == 0)
         {
            this.selectGrade2.textColor = StaticValue.WHITE;
            this.selectGrade2.text = LanResManager.getLanCommonTextWords("普品天机锤");
         }
         else if(int1 == 1)
         {
            this.selectGrade2.textColor = StaticValue.BLUE;
            this.selectGrade2.text = LanResManager.getLanCommonTextWords("蓝品锻造锤");
         }
         else if(int1 == 2)
         {
            this.selectGrade2.textColor = StaticValue.GREEN;
            this.selectGrade2.text = LanResManager.getLanCommonTextWords("绿品锻造锤");
         }
         else if(int1 == 3)
         {
            this.selectGrade2.textColor = StaticValue.PURPLE;
            this.selectGrade2.text = LanResManager.getLanCommonTextWords("紫品神锻锤");
         }
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.stop();
            this.mc.parent.removeChild(this.mc);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            mc = _loc2_.content as MovieClip;
            mc.x = 90 - mc.width / 2;
            mc.y = 170 - mc.height / 2;
            addChild(mc);
            mc.stop();
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/qianchuibailian/qichui.swf");
      }
      
      public function playAutoMC() : void
      {
         if(this.mc)
         {
            this.mc.play();
         }
      }
      
      public function setXuliFun(param1:Boolean) : void
      {
         this.xuliBtn.skin = "qianchuibailian_xuliBtn";
      }
      
      public function setZidongBtnFun(param1:Boolean) : void
      {
         if(param1)
         {
            this.zidongBtn.label = LanResManager.getLanCommonTextWords("自动锻造");
         }
         else
         {
            this.zidongBtn.label = LanResManager.getLanCommonTextWords("停止锻造");
         }
      }
      
      public function setItem(param1:Goods) : void
      {
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.item1 = new ItemFace(param1);
         this.item1.x = 88;
         this.item1.y = 141;
         addChild(this.item1);
         this.fangruBtn.label = LanResManager.getLanCommonTextWords("取出装备");
      }
      
      public function getItem() : void
      {
         if(this.item1 != null && this.item1.parent != null)
         {
            this.item1.parent.removeChild(this.item1);
         }
         this.fangruBtn.label = LanResManager.getLanCommonTextWords("放入装备");
      }
      
      public function setGoods(param1:Goods) : void
      {
         if(this.item2 != null && this.item2.parent != null)
         {
            this.item2.parent.removeChild(this.item2);
         }
         this.item2 = new ItemFace(param1);
         this.item2.x = 214;
         this.item2.y = 195;
         addChild(this.item2);
         if(param1.count <= 0)
         {
            this.item2.filters = Tools.blackWhiteFilter;
         }
         this.goodsFta.htmlText = param1.res.name;
         if(param1.res.name == LanResManager.getLanCommonTextWords("普品天机锤"))
         {
            this.nameFta.textColor = StaticValue.WHITE;
            this.nameFta.htmlText = param1.res.name;
         }
         else if(param1.res.name == LanResManager.getLanCommonTextWords("蓝品锻造锤"))
         {
            this.nameFta.textColor = StaticValue.BLUE;
            this.nameFta.htmlText = param1.res.name;
         }
         else if(param1.res.name == LanResManager.getLanCommonTextWords("绿品锻造锤"))
         {
            this.nameFta.textColor = StaticValue.GREEN;
            this.nameFta.htmlText = param1.res.name;
         }
         else if(param1.res.name == LanResManager.getLanCommonTextWords("紫品神锻锤"))
         {
            this.nameFta.textColor = StaticValue.PURPLE;
            this.nameFta.htmlText = param1.res.name;
         }
      }
      
      public function setJilv(param1:int, param2:int, param3:String) : void
      {
         this.jilvBar.setValue(param1,param2);
         this.jiangliFta.htmlText = param3;
      }
      
      public function setEnabled1(param1:Boolean) : void
      {
         this.selectBtn1.enabled = param1;
      }
      
      public function setEnabled2(param1:Boolean) : void
      {
         this.xuliBtn.enabled = param1;
      }
      
      public function setEnabled3(param1:Boolean) : void
      {
         this.zidongBtn.enabled = param1;
      }
      
      public function setFuzengDuanzaozhi(param1:int, param2:int) : void
      {
         this.fuzeng.setFuzengDuanzaozhi(param1,param2);
      }
      
      public function setFuzengShuxing(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.fuzeng.setFuzengShuxing(param1,param2,param3,param4,param5,param6);
      }
      
      public function setFuzengGoods(param1:Array, param2:int) : void
      {
         var value:Array = param1;
         var vi:int = param2;
         if(value.length > 0)
         {
            if(Boolean(this.mc) && this.mc.parent != null)
            {
               this.mc.stop();
               this.mc.parent.removeChild(this.mc);
            }
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               mc = _loc2_.content as MovieClip;
               mc.x = 90 - mc.width / 2;
               mc.y = 170 - mc.height / 2;
               addChild(mc);
            },null,false,GameConfig.fileBaseFolder + "res/data/mc/qianchuibailian/qichui.swf");
         }
         this.fuzeng.setFuzengGoods(value,vi);
      }
      
      public function TurnClose() : void
      {
         if(Boolean(this.mc) && this.mc.parent != null)
         {
            this.mc.stop();
            this.mc.parent.removeChild(this.mc);
         }
         this.fuzeng.TurnClose();
      }
      
      public function showFirendPanel() : QianchuiBailianYouhaoduPanel
      {
         if(!this.qianchuibailianyouhaoduPanel)
         {
            this.qianchuibailianyouhaoduPanel = new QianchuiBailianYouhaoduPanel();
            this.qianchuibailianyouhaoduPanel.$parent = this;
         }
         this.qianchuibailianyouhaoduPanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.qianchuibailianyouhaoduPanel);
         this.qianchuibailianyouhaoduPanel.x = (GameConfig.sceneWidth - this.qianchuibailianyouhaoduPanel.panelWidth) / 2;
         this.qianchuibailianyouhaoduPanel.y = (GameConfig.sceneHeight - this.qianchuibailianyouhaoduPanel.panelHeight) / 2;
         return this.qianchuibailianyouhaoduPanel;
      }
      
      public function setFriendVilue(param1:Array) : void
      {
         if(this.qianchuibailianyouhaoduPanel)
         {
            this.qianchuibailianyouhaoduPanel.setFriendVilue(param1);
         }
      }
   }
}

