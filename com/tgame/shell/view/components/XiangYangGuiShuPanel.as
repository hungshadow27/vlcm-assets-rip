package com.tgame.shell.view.components
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.shell.view.components.gongcheng.GongChengHelpCanvas;
   import com.tgame.shell.view.components.gongcheng.GongChengToDoPanel;
   import com.tgame.shell.view.components.gongcheng.RevenuePanel;
   import com.tgame.shell.view.components.gongcheng.SumbitGongChengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.events.*;
   import flash.text.*;
   
   public class XiangYangGuiShuPanel extends FPanel
   {
      
      public static const UI_XIANGYANGGUISHU_MODIFY_AFFICHE:String = "UI_XIANGYANGGUISHU_MODIFY_AFFICHE";
      
      public static const UI_XIANGYANGGUISHU_REVENUE:String = "UI_XIANGYANGGUISHU_REVENUE";
      
      public static const UI_XIANGYANGGUISHU_TODO:String = "UI_XIANGYANGGUISHU_TODO";
      
      public static const UI_XIANGYANGGUISHU_SUMBIT:String = "UI_XIANGYANGGUISHU_SUMBIT";
      
      public static const UI_XIANGYANGGUISHU_GET:String = "UI_XIANGYANGGUISHU_GET";
      
      public static const UI_XIANGYANGGUISHU_REVENUE_GET:String = "UI_XIANGYANGGUISHU_REVENUE_GET";
      
      public static const UI_XIANGYANGGUISHU_REVENUE_OK:String = "UI_XIANGYANGGUISHU_REVENUE_OK";
      
      public static const UI_XIANGYANGGUISHU_SUMBIT_OK:String = "UI_XIANGYANGGUISHU_SUMBIT_OK";
      
      public static const UI_XIANGYANGGUISHU_SHOP_SHOW:String = "UI_XIANGYANGGUISHU_SHOP_SHOW";
      
      private var partyName:FTextArea;
      
      private var name1:FTextArea;
      
      private var name2:FTextArea;
      
      private var name3:FTextArea;
      
      private var name4:FTextArea;
      
      private var name5:FTextArea;
      
      private var btn1:SmallButton;
      
      private var btn2:SmallButton;
      
      private var btn3:SmallButton;
      
      private var btn4:SmallButton;
      
      private var btn5:SmallButton;
      
      private var shopBtn:SecondButton;
      
      private var revenueBtn:SecondButton;
      
      private var helpBtn:SecondButton;
      
      private var todoBtn:SecondButton;
      
      private var sumbitBtn:SecondButton;
      
      private var helpCanvas:GongChengHelpCanvas;
      
      private var revenuePanel:RevenuePanel;
      
      private var sumbitPanel:SumbitGongChengPanel;
      
      private var todoPanel:GongChengToDoPanel;
      
      private var mc:MovieClip;
      
      private var item:ItemFace;
      
      public function XiangYangGuiShuPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         var ft:FTextArea;
         var fb:FLabel;
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 680;
         height = 380;
         titleText = LanResManager.getLanCommonTextWords("襄阳归属");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.xiangyang.adscription.ui";
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 20;
            y = 200;
            width = 74;
            height = 20;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'5\'>" + LanResManager.getLanTextWords(this,"帮主特权") + "</textformat>";
         }
         addChild(ft);
         this.partyName = new FTextArea();
         with(this.partyName)
         {
            x = 314;
            y = 30;
            width = 353;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("帮会名字");
         }
         addChild(this.partyName);
         fb = new FLabel();
         with(fb)
         {
            x = 392;
            y = 74;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("城主");
         }
         addChild(fb);
         this.name1 = new FTextArea();
         with(this.name1)
         {
            x = 456;
            y = 74;
            width = 119;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.name1);
         fb = new FLabel();
         with(fb)
         {
            x = 454;
            y = 94;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每日免费领取金锭") + "*1";
         }
         addChild(fb);
         this.btn1 = new SmallButton();
         this.btn1.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn1);
         this.btn1.x = 606;
         this.btn1.y = 72;
         this.btn1.addEventListener(MouseEvent.CLICK,this.onClick);
         fb = new FLabel();
         with(fb)
         {
            x = 392;
            y = 119;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("副城主");
         }
         addChild(fb);
         this.name2 = new FTextArea();
         with(this.name2)
         {
            x = 456;
            y = 119;
            width = 119;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.name2);
         fb = new FLabel();
         with(fb)
         {
            x = 454;
            y = 139;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每日免费领取银锭") + "*2";
         }
         addChild(fb);
         this.btn2 = new SmallButton();
         this.btn2.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn2);
         this.btn2.x = 606;
         this.btn2.y = 117;
         this.btn2.addEventListener(MouseEvent.CLICK,this.onClick);
         fb = new FLabel();
         with(fb)
         {
            x = 387;
            y = 165;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("兵马元帅");
         }
         addChild(fb);
         this.name3 = new FTextArea();
         with(this.name3)
         {
            x = 456;
            y = 165;
            width = 119;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.name3);
         fb = new FLabel();
         with(fb)
         {
            x = 454;
            y = 185;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每日免费领取铁锭") + "*2";
         }
         addChild(fb);
         this.btn3 = new SmallButton();
         this.btn3.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn3);
         this.btn3.x = 606;
         this.btn3.y = 163;
         this.btn3.addEventListener(MouseEvent.CLICK,this.onClick);
         fb = new FLabel();
         with(fb)
         {
            x = 387;
            y = 212;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("政令大臣");
         }
         addChild(fb);
         this.name4 = new FTextArea();
         with(this.name4)
         {
            x = 456;
            y = 212;
            width = 119;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.name4);
         fb = new FLabel();
         with(fb)
         {
            x = 454;
            y = 232;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每日免费领取铁锭") + "*2";
         }
         addChild(fb);
         this.btn4 = new SmallButton();
         this.btn4.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn4);
         this.btn4.x = 606;
         this.btn4.y = 210;
         this.btn4.addEventListener(MouseEvent.CLICK,this.onClick);
         fb = new FLabel();
         with(fb)
         {
            x = 387;
            y = 257;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("后勤总管");
         }
         addChild(fb);
         this.name5 = new FTextArea();
         with(this.name5)
         {
            x = 456;
            y = 257;
            width = 119;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.name5);
         fb = new FLabel();
         with(fb)
         {
            x = 454;
            y = 277;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("每日免费领取铁锭") + "*2";
         }
         addChild(fb);
         this.btn5 = new SmallButton();
         this.btn5.label = LanResManager.getLanCommonTextWords("领取");
         addChild(this.btn5);
         this.btn5.x = 606;
         this.btn5.y = 255;
         this.btn5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.revenueBtn = new SecondButton();
         with(this.revenueBtn)
         {
            label = LanResManager.getLanCommonTextWords("税率与税收");
            x = 64;
            y = 314;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.revenueBtn);
         this.shopBtn = new SecondButton();
         this.shopBtn.label = LanResManager.getLanCommonTextWords("城战声望商店购物");
         this.shopBtn.x = this.revenueBtn.x + this.revenueBtn.width + 5;
         this.shopBtn.y = 314;
         this.shopBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.shopBtn);
         this.helpBtn = new SecondButton();
         with(this.helpBtn)
         {
            label = LanResManager.getLanCommonTextWords("攻城规则查询");
            x = 310;
            y = 314;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.helpBtn);
         this.todoBtn = new SecondButton();
         with(this.todoBtn)
         {
            label = LanResManager.getLanCommonTextWords("攻城日程查询");
            x = helpBtn.x + helpBtn.width + 5;
            y = 314;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.todoBtn);
         this.sumbitBtn = new SecondButton();
         with(this.sumbitBtn)
         {
            label = LanResManager.getLanCommonTextWords("提交攻城申请");
            x = todoBtn.x + todoBtn.width + 5;
            y = 314;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.sumbitBtn);
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            mc = _loc2_.content as MovieClip;
            mc.x = 13;
            mc.y = 24;
            addChildAt(mc,1);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/youlongziren.swf");
      }
      
      private function showHelpPanel() : void
      {
         if(!this.helpCanvas)
         {
            this.helpCanvas = new GongChengHelpCanvas();
         }
         GameInstance.uiInstance.uiContainer.addChild(this.helpCanvas);
         this.helpCanvas.x = (GameConfig.sceneWidth - this.helpCanvas.width) / 2;
         this.helpCanvas.y = (GameConfig.sceneHeight - this.helpCanvas.height) / 2;
      }
      
      private function onAddToStage(param1:Event) : void
      {
         if(this.mc)
         {
            this.mc.play();
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.mc)
         {
            this.mc.stop();
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_GET,"",1));
               break;
            case this.btn2:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_GET,"",2));
               break;
            case this.btn3:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_GET,"",3));
               break;
            case this.btn4:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_GET,"",4));
               break;
            case this.btn5:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_GET,"",5));
               break;
            case this.revenueBtn:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_REVENUE));
               break;
            case this.helpBtn:
               this.showHelpPanel();
               break;
            case this.todoBtn:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_TODO));
               break;
            case this.sumbitBtn:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_SUMBIT));
               break;
            case this.shopBtn:
               dispatchEvent(new BaseEvent(UI_XIANGYANGGUISHU_SHOP_SHOW));
         }
      }
      
      public function setAffiche(param1:String, param2:Boolean) : void
      {
      }
      
      public function setPartyName(param1:String) : void
      {
         this.partyName.text = param1;
      }
      
      public function setChengZhu(param1:String) : void
      {
         this.name1.text = param1;
      }
      
      public function setFuChengZhu(param1:String) : void
      {
         this.name2.text = param1;
      }
      
      public function setYuanShuai(param1:String) : void
      {
         this.name3.text = param1;
      }
      
      public function setDaChen(param1:String) : void
      {
         this.name4.text = param1;
      }
      
      public function setZhuGuan(param1:String) : void
      {
         this.name5.text = param1;
      }
      
      public function reset() : void
      {
         this.setAffiche("",false);
         this.setChengZhu("");
         this.setFuChengZhu("");
         this.setPartyName("");
         this.setYuanShuai("");
         this.setDaChen("");
         this.setZhuGuan("");
      }
      
      public function showRevenuePanel() : void
      {
         if(!this.revenuePanel)
         {
            this.revenuePanel = new RevenuePanel();
            this.revenuePanel.$parent = this;
         }
         this.revenuePanel.visible = true;
         GameInstance.uiInstance.uiContainer.addChild(this.revenuePanel);
         this.revenuePanel.x = (GameConfig.sceneWidth - this.revenuePanel.panelWidth) / 2;
         this.revenuePanel.y = (GameConfig.sceneHeight - this.revenuePanel.panelHeight) / 2;
      }
      
      public function setRevenueValue(param1:int, param2:Number, param3:Number, param4:int, param5:int, param6:int) : void
      {
         this.revenuePanel.setCess(param1);
         this.revenuePanel.setRevenue(param2);
         this.revenuePanel.setRevenueValue(param3);
         this.revenuePanel.setValue(param4,param5,param6);
      }
      
      public function showSumbitPanel(param1:Date) : void
      {
         if(!this.sumbitPanel)
         {
            this.sumbitPanel = new SumbitGongChengPanel();
            this.sumbitPanel.$parent = this;
         }
         this.sumbitPanel.visible = true;
         this.sumbitPanel.setTime(param1);
         GameInstance.uiInstance.uiContainer.addChild(this.sumbitPanel);
         this.sumbitPanel.x = (GameConfig.sceneWidth - this.sumbitPanel.panelWidth) / 2;
         this.sumbitPanel.y = (GameConfig.sceneHeight - this.sumbitPanel.panelHeight) / 2;
      }
      
      public function showTodoPanel(param1:Array) : void
      {
         if(!this.todoPanel)
         {
            this.todoPanel = new GongChengToDoPanel();
         }
         this.todoPanel.visible = true;
         this.todoPanel.setTodoValue(param1);
         GameInstance.uiInstance.uiContainer.addChild(this.todoPanel);
         this.todoPanel.x = (GameConfig.sceneWidth - this.todoPanel.panelWidth) / 2;
         this.todoPanel.y = (GameConfig.sceneHeight - this.todoPanel.panelHeight) / 2;
      }
      
      public function setItem(param1:BaseItem) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         addChild(this.item);
         this.item.x = 270;
         this.item.y = 127;
      }
   }
}

