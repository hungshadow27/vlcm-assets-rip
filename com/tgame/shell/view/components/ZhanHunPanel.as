package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.McBaseItem;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.text.*;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import gs.TweenMax;
   
   public class ZhanHunPanel extends FPanel
   {
      
      public static const UI_ZHANHUN_YIJIANZHANHUI_CLICK:String = "UI_ZHANHUN_YIJIANZHANHUI_CLICK";
      
      public static const UI_ZHANHUN_YIJIANSHIQU_CLICK:String = "UI_ZHANHUN_YIJIANSHIQU_CLICK";
      
      public static const UI_ZHANHUN_YIJIANMAICHU_CLICK:String = "UI_ZHANHUN_YIJIANMAICHU_CLICK";
      
      public static const UI_ZHANHUN_XIANGQIAN_CLICK:String = "UI_ZHANHUN_XIANGQIAN_CLICK";
      
      public static const UI_ZHANHUN_NPC_CLICK:String = "UI_ZHANHUN_NPC_CLICK";
      
      public static const UI_ZHANHUN_DUIHUAN_CLICK:String = "UI_ZHANHUN_DUIHUAN_CLICK";
      
      public static const UI_ZHANHUN_MAICHU_CLICK:String = "UI_ZHANHUN_MAICHU_CLICK";
      
      public static const UI_ZHANHUN_SHIQU_CLICK:String = "UI_ZHANHUN_SHIQU_CLICK";
      
      public static const UI_CHENGSEZHANHUN_CLICK:String = "UI_CHENGSEZHANHUN_CLICK";
      
      public static const UI_ZHANHUN_QIANKUNYIZHI_CLICK:String = "UI_ZHANHUN_QIANKUNYIZHI_CLICK";
      
      public static const UI_ZHANHUNDUIHUAN_DUIHUANBAOSHICANVAS:String = "UI_ZHANHUNDUIHUAN_DUIHUANBAOSHICANVAS";
      
      public static const UI_DUIHUANBAOSHICANVAS_SHANGYIYE:String = "UI_DUIHUANBAOSHICANVAS_SHANGYIYE";
      
      public static const UI_DUIHUANBAOSHICANVAS_XIAYIYE:String = "UI_DUIHUANBAOSHICANVAS_XIAYIYE";
      
      public static const UI_DUIHUANBAOSHICANVAS_DUIHUAN:String = "UI_DUIHUANBAOSHICANVAS_DUIHUAN";
      
      public static const UI_ZHANHUNDUIHUAN_DUIHUANZHANHUNCANVAS:String = "UI_ZHANHUNDUIHUAN_DUIHUANZHANHUNCANVAS";
      
      public static const UI_DUIHUANZHANHUNCANVAS_DUIHUAN:String = "UI_DUIHUANZHANHUNCANVAS_DUIHUAN";
      
      public static const UI_ZHANHUNQIANKUNYIZHITIPSHOW:String = "UI_ZHANHUNQIANKUNYIZHITIPSHOW";
      
      public static const UI_ZHANHUNQIANKUNYIZHITIPSHOW_OK:String = "UI_ZHANHUNQIANKUNYIZHITIPSHOW_OK";
      
      public static const UI_ZHANHUNQIANKUNYIZHITIPSHOW_CANCLE:String = "UI_ZHANHUNQIANKUNYIZHITIPSHOW_CANCLE";
      
      private var tongBiTa:FTextArea;
      
      private var jiFenTa:FTextArea;
      
      private var yiJianZhanHunBtn:NewButton;
      
      private var yiJianShiQuBtn:NewButton;
      
      private var yiJianMaiChuBtn:NewButton;
      
      private var zhuangBeiXiangQianBtn:SimpleButton;
      
      private var npcBtn:SimpleButton;
      
      private var tip:FTextArea;
      
      private var tipCanvas:FCanvas;
      
      private var container:Sprite;
      
      private var duiHuanBtn:SecondButton;
      
      private var guiZeBtn:SecondButton;
      
      private var guiZePanel:ZhanHunGuiZeCanvas;
      
      private var clickNpcIndex:int = 4;
      
      private var npcBtnArray:Array;
      
      private var zhanHunArr:Array;
      
      private var npcArr:Array;
      
      private var dictZhanHun:Dictionary;
      
      public var bgImg:Bitmap;
      
      private var mcSign:MovieClip;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var isUseJieLi:Boolean;
      
      private var zhanhunArray:Array;
      
      private var qianKunYiZhiBtn:NewButton;
      
      private var ZhanhunDuihuanBtn:SecondButton;
      
      private var ynBtn:SecondButton;
      
      private var baoshiFta:FTextArea;
      
      private var DuihuanPanel:ZhanHunDuiHuan;
      
      public function ZhanHunPanel()
      {
         var v:Vector.<Bitmap>;
         var tempWd:int;
         var $class:Class;
         var i:int;
         var bg:F9GridBitmap;
         var $class1:* = undefined;
         var blackWhiteFilter:Array = null;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 764;
         height = 386 + 78;
         titleText = LanResManager.getLanCommonTextWords("战魂");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.bgImg = new Bitmap();
         this.bgImg.x = 10;
         this.bgImg.y = 2;
         this.bgImg.name = "ui.zhanhun.panel.bg";
         addChild(this.bgImg);
         v = new Vector.<Bitmap>();
         v.push(this.bgImg);
         this.DynamicManageImages = v;
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         this.yiJianZhanHunBtn = new NewButton();
         this.yiJianZhanHunBtn.label = LanResManager.getLanCommonTextWords("一键战魂");
         this.yiJianZhanHunBtn.setSkin("yiJianZhanHunButton");
         this.yiJianZhanHunBtn.setPandding(24,2,52,8);
         addChild(this.yiJianZhanHunBtn);
         this.yiJianZhanHunBtn.x = 380;
         this.yiJianZhanHunBtn.y = 195;
         this.yiJianZhanHunBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有VIP玩家才可以使用，自动战魂") + "</font>";
         this.yiJianZhanHunBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.qianKunYiZhiBtn = new NewButton();
         this.qianKunYiZhiBtn.label = LanResManager.getLanCommonTextWords("乾坤一掷战魂");
         this.qianKunYiZhiBtn.setSkin("qiankunyizhiBtn");
         this.qianKunYiZhiBtn.setPandding(24,2,52,8);
         addChild(this.qianKunYiZhiBtn);
         this.qianKunYiZhiBtn.x = 240;
         this.qianKunYiZhiBtn.y = 195;
         this.qianKunYiZhiBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用200元宝进行战魂抽取，可直接抽取紫色战魂，并有较大几率获稀有的橙色战魂") + "</font>";
         this.qianKunYiZhiBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick2);
         this.qianKunYiZhiBtn.enabled = true;
         this.ynBtn = new SecondButton();
         this.ynBtn.x = 170;
         this.ynBtn.y = 220;
         this.ynBtn.label = LanResManager.getLanCommonTextWords("橙色战魂");
         this.ynBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("只能使用橙魂卡获得战魂") + "</font>";
         this.ynBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         addChild(this.ynBtn);
         tempWd = 140;
         this.yiJianShiQuBtn = new NewButton();
         this.yiJianShiQuBtn.label = LanResManager.getLanCommonTextWords("一键拾取");
         this.yiJianShiQuBtn.setSkin("yiJianShiQuZhanHunButton");
         this.yiJianShiQuBtn.setPandding(24,2,52,8);
         addChild(this.yiJianShiQuBtn);
         this.yiJianShiQuBtn.x = this.yiJianZhanHunBtn.x + tempWd + 3;
         this.yiJianShiQuBtn.y = this.yiJianZhanHunBtn.y;
         this.yiJianShiQuBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将灰色以上的所有战魂回收到包裹中") + "</font>";
         this.yiJianShiQuBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.yiJianMaiChuBtn = new NewButton();
         this.yiJianMaiChuBtn.label = LanResManager.getLanCommonTextWords("一键卖出");
         this.yiJianMaiChuBtn.setSkin("yiJianMaiChuZhanHunButton");
         this.yiJianMaiChuBtn.setPandding(24,2,52,8);
         addChild(this.yiJianMaiChuBtn);
         this.yiJianMaiChuBtn.x = this.yiJianZhanHunBtn.x + tempWd * 2 - 20;
         this.yiJianMaiChuBtn.y = this.yiJianZhanHunBtn.y;
         this.yiJianMaiChuBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("卖出所有【厄运】") + "</font>";
         this.yiJianMaiChuBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         $class = getDefinitionByName("ui.zhanhun.zhuangbeixiangqian.btn") as Class;
         this.zhuangBeiXiangQianBtn = new $class() as SimpleButton;
         addChild(this.zhuangBeiXiangQianBtn);
         this.zhuangBeiXiangQianBtn.x = 635;
         this.zhuangBeiXiangQianBtn.y = 265;
         this.zhuangBeiXiangQianBtn.addEventListener(MouseEvent.CLICK,this.onXiangQianBtn);
         this.npcBtnArray = new Array();
         i = 0;
         while(i < 5)
         {
            $class1 = getDefinitionByName("ui.zhanhun.npcbtn." + (i + 1)) as Class;
            this.npcBtn = new $class1() as SimpleButton;
            this.npcBtn.name = "" + i;
            blackWhiteFilter = [new ColorMatrixFilter([0.3086,0.6094,0.082,0,-50,0.3086,0.6094,0.082,0,-50,0.3086,0.6094,0.082,0,-50,0,0,0,1,0])];
            switch(i)
            {
               case 0:
                  this.npcBtn.x = 40;
                  break;
               case 1:
                  this.npcBtn.x = 39 + 117;
                  this.npcBtn.filters = blackWhiteFilter;
                  break;
               case 2:
                  this.npcBtn.x = 38 + i * 117;
                  this.npcBtn.filters = blackWhiteFilter;
                  break;
               case 3:
                  this.npcBtn.x = 38 + i * 117;
                  this.npcBtn.filters = blackWhiteFilter;
                  break;
               case 4:
                  this.npcBtn.x = 35 + i * 120;
                  this.npcBtn.filters = blackWhiteFilter;
            }
            this.npcBtn.y = 285;
            addChild(this.npcBtn);
            this.npcBtn.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
            this.npcBtn.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
            this.npcBtnArray.push(this.npcBtn);
            i++;
         }
         this.mcSign = StaticValue.getMCByClassName("ui.zhanhun.npc.mc") as MovieClip;
         this.mcSign.x = 105;
         this.mcSign.y = 265;
         this.mcSign.gotoAndStop(0);
         addChild(this.mcSign);
         this.jiFenTa = new FTextArea();
         with(this.jiFenTa)
         {
            x = 50;
            y = 400;
            htmlText = "";
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.jiFenTa);
         bg = Tools.get9GridBitmpByName("inputBg");
         addChildAt(bg,0);
         bg.x = this.jiFenTa.x + 58;
         bg.y = this.jiFenTa.y - 2;
         bg.width = 58;
         this.tongBiTa = new FTextArea();
         with(this.tongBiTa)
         {
            x = 580 - 50 - 40;
            y = jiFenTa.y;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.tongBiTa);
         bg = Tools.get9GridBitmpByName("inputBg");
         addChildAt(bg,0);
         bg.x = this.tongBiTa.x + 58 - 21;
         bg.y = this.tongBiTa.y - 2;
         bg.width = 67;
         this.baoshiFta = new FTextArea();
         addChild(this.baoshiFta);
         this.baoshiFta.multiline = true;
         this.baoshiFta.autoSize = TextFieldAutoSize.LEFT;
         this.baoshiFta.wordWrap = true;
         this.baoshiFta.width = 150;
         this.baoshiFta.height = 30;
         this.baoshiFta.x = 580 + 110 - 50 - 40;
         this.baoshiFta.y = this.jiFenTa.y;
         this.baoshiFta.filters = StaticValue.filter;
         this.baoshiFta.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂宝石") + "：</font>";
         bg = Tools.get9GridBitmpByName("inputBg");
         addChildAt(bg,0);
         bg.x = this.tongBiTa.x + 58 - 21 + 110 + 13 + 40;
         bg.y = this.tongBiTa.y - 2;
         bg.width = 67;
         this.duiHuanBtn = new SecondButton();
         this.duiHuanBtn.label = LanResManager.getLanCommonTextWords("兑换");
         addChild(this.duiHuanBtn);
         this.duiHuanBtn.x = this.jiFenTa.x + 117;
         this.duiHuanBtn.y = this.jiFenTa.y - 3;
         this.duiHuanBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = this.jiFenTa.x + 180 - 25;
         --this.jiFenTa.y;
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --jiFenTa.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("借力用力");
         }
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.checkLabel.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         addChild(this.checkLabel);
         this.guiZeBtn = new SecondButton();
         this.guiZeBtn.label = LanResManager.getLanCommonTextWords("战魂规则");
         addChild(this.guiZeBtn);
         this.guiZeBtn.x = 370 - 40 - 30;
         this.guiZeBtn.y = this.jiFenTa.y - 3;
         this.guiZeBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.ZhanhunDuihuanBtn = new SecondButton();
         this.ZhanhunDuihuanBtn.label = LanResManager.getLanCommonTextWords("战魂兑换");
         addChild(this.ZhanhunDuihuanBtn);
         this.ZhanhunDuihuanBtn.x = 370 - 40 + 120 - 30 - 40;
         this.ZhanhunDuihuanBtn.y = this.jiFenTa.y - 3;
         this.ZhanhunDuihuanBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.container = new Sprite();
         addChild(this.container);
         this.zhanHunArr = new Array();
         this.dictZhanHun = new Dictionary();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.removeZhanHun();
            parent.removeChild(this);
         }
      }
      
      private function onNpcClick(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.target.name;
         var _loc3_:int = Number(_loc2_);
         this.clickNpcIndex = _loc3_;
         dispatchEvent(new BaseEvent(UI_ZHANHUN_NPC_CLICK,"",[this.npcArr[_loc3_].id,this.check.selectState ? 1 : 0]));
      }
      
      private function onXiangQianBtn(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_ZHANHUN_XIANGQIAN_CLICK));
      }
      
      private function onBtnClick2(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(UI_ZHANHUN_QIANKUNYIZHI_CLICK));
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target.label)
         {
            case LanResManager.getLanCommonTextWords("战魂规则"):
               if(!this.guiZePanel)
               {
                  this.guiZePanel = new ZhanHunGuiZeCanvas();
                  this.guiZePanel.$parent = this;
               }
               this.guiZePanel.x = (GameConfig.sceneWidth - this.guiZePanel.width) / 2;
               this.guiZePanel.y = (GameConfig.sceneHeight - this.guiZePanel.height) / 2;
               GameInstance.uiInstance.uiContainer.addChild(this.guiZePanel);
               break;
            case LanResManager.getLanCommonTextWords("战魂兑换"):
               if(!this.DuihuanPanel)
               {
                  this.DuihuanPanel = new ZhanHunDuiHuan();
                  this.DuihuanPanel.$parent = this;
                  this.DuihuanPanel.setParent = this;
               }
               this.DuihuanPanel.x = (GameConfig.sceneWidth - this.DuihuanPanel.width) / 2;
               this.DuihuanPanel.y = (GameConfig.sceneHeight - this.DuihuanPanel.height) / 2;
               GameInstance.uiInstance.uiContainer.addChild(this.DuihuanPanel);
               break;
            case LanResManager.getLanCommonTextWords("一键战魂"):
               dispatchEvent(new BaseEvent(UI_ZHANHUN_YIJIANZHANHUI_CLICK,"",this.check.selectState ? 1 : 0));
               break;
            case LanResManager.getLanCommonTextWords("一键拾取"):
               dispatchEvent(new BaseEvent(UI_ZHANHUN_YIJIANSHIQU_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("一键卖出"):
               dispatchEvent(new BaseEvent(UI_ZHANHUN_YIJIANMAICHU_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("兑换"):
               dispatchEvent(new BaseEvent(UI_ZHANHUN_DUIHUAN_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("橙色战魂"):
               dispatchEvent(new BaseEvent(UI_CHENGSEZHANHUN_CLICK));
         }
      }
      
      private function onCom(param1:DisplayObject) : void
      {
         if(param1 != null && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
         }
      }
      
      private function onComItemFace(param1:DisplayObject) : void
      {
         if(param1 != null && Boolean(param1.parent))
         {
            param1.parent.removeChild(param1);
            if(param1 is ItemFace)
            {
               (param1 as ItemFace).destroy();
            }
         }
      }
      
      private function onShiQuClick(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.target.name;
         var _loc3_:int = Number(_loc2_);
         dispatchEvent(new BaseEvent(UI_ZHANHUN_SHIQU_CLICK,"",_loc3_));
      }
      
      private function onMaiChuClick(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.target.name;
         var _loc3_:int = Number(_loc2_);
         dispatchEvent(new BaseEvent(UI_ZHANHUN_MAICHU_CLICK,"",_loc3_));
      }
      
      private function addZhanHunToStage(param1:int, param2:Object) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc9_:FTextArea = null;
         _loc3_ = 27 + param1 % 10 * 70;
         _loc4_ = 10 + Math.floor(param1 / 10) * 100;
         var _loc5_:Sprite = new Sprite();
         var _loc6_:McBaseItem = new McBaseItem(param2.goodid);
         _loc6_.daojuId = param2.daojuid;
         _loc6_.name = param2.name;
         _loc6_.dengji = param2.dengji;
         _loc6_.quality = param2.type;
         _loc6_.miaoshu = param2.miaoshu;
         _loc6_.jiage = param2.price;
         var _loc7_:ItemFace = new ItemFace(_loc6_);
         _loc7_.name = "" + param2.id;
         _loc7_.setMcName(true,false);
         _loc7_.x = 5;
         _loc7_.y = 3.5;
         if(param2.type != 1)
         {
            _loc7_.addEventListener(MouseEvent.CLICK,this.onShiQuClick);
         }
         else
         {
            _loc7_.addEventListener(MouseEvent.CLICK,this.onMaiChuClick);
         }
         _loc5_.addChildAt(_loc7_,0);
         var _loc8_:FTextArea = new FTextArea();
         _loc8_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "<a href=\'event:\'><u>" + LanResManager.getLanCommonTextWords("卖出") + "</u></a>" + "</font>";
         _loc8_.name = "" + param2.id;
         _loc8_.x = 20;
         _loc8_.y = 65;
         _loc8_.width = 30;
         _loc8_.height = 16;
         _loc8_.addEventListener(MouseEvent.CLICK,this.onMaiChuClick);
         _loc5_.addChild(_loc8_);
         if(param2.type != 1)
         {
            _loc9_ = new FTextArea();
            _loc9_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + "<a href=\'event:\'><u>" + LanResManager.getLanCommonTextWords("拾取") + "</u></a>" + "</font>";
            _loc9_.name = "" + param2.id;
            _loc9_.x = 5;
            _loc9_.y = 65;
            _loc9_.width = 30;
            _loc9_.height = 16;
            _loc9_.addEventListener(MouseEvent.CLICK,this.onShiQuClick);
            _loc5_.addChild(_loc9_);
            _loc8_.x = 35;
            _loc8_.y = 65;
         }
         _loc5_.x = _loc3_;
         _loc5_.y = _loc4_;
         this.container.addChild(_loc5_);
         this.dictZhanHun[param2.id] = _loc5_;
      }
      
      private function sortZhanHun() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Sprite = null;
         if(this.zhanHunArr == null || this.zhanHunArr.length == 0)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.zhanHunArr.length)
         {
            _loc2_ = 27 + _loc1_ % 10 * 70;
            _loc3_ = 10 + Math.floor(_loc1_ / 10) * 100;
            _loc4_ = this.dictZhanHun[this.zhanHunArr[_loc1_].id];
            _loc4_.name = "" + _loc1_;
            _loc4_.x = _loc2_;
            _loc4_.y = _loc3_;
            _loc1_++;
         }
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.checkLabel.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("选中后单击头像时将扣除道具不额外扣除铜币。借力用力时，不支持一键战魂使用") + "</font></textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.checkLabel.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
         }
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         var _loc2_:String = param1.currentTarget.name;
         var _loc3_:int = Number(_loc2_);
         var _loc4_:DisplayObject = getChildByName(_loc2_);
         var _loc5_:String = "";
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc5_ = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + this.npcArr[_loc3_].name + "<br></font>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("所需费用") + ":" + this.npcArr[_loc3_].tip + "</font></textformat>";
               this.showTip(_loc5_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               _loc4_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 5;
         this.tipCanvas.y = mouseY + 5;
      }
      
      public function setJiFen(param1:int) : void
      {
         this.jiFenTa.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前积分") + "：" + param1;
      }
      
      public function setTongBi(param1:Number) : void
      {
         this.tongBiTa.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("游戏铜钱") + "：" + param1;
      }
      
      public function setBaoShi(param1:int) : void
      {
         this.baoshiFta.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("战魂宝石:") + " " + param1 + "</font>";
      }
      
      public function setNpcBtnStatus(param1:Array) : void
      {
         var _loc3_:Array = null;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            if(param1[_loc2_].state == 0)
            {
               this.npcBtnArray[_loc2_].enabled = false;
               _loc3_ = [new ColorMatrixFilter([0.3086,0.6094,0.082,0,-50,0.3086,0.6094,0.082,0,-50,0.3086,0.6094,0.082,0,-50,0,0,0,1,0])];
               this.npcBtnArray[_loc2_].filters = _loc3_;
               if(this.npcBtnArray[_loc2_].hasEventListener(MouseEvent.CLICK))
               {
                  this.npcBtnArray[_loc2_].removeEventListener(MouseEvent.CLICK,this.onNpcClick);
               }
            }
            else
            {
               this.mcSign.x = this.npcBtnArray[_loc2_].x + 65;
               this.mcSign.y = this.npcBtnArray[_loc2_].y - 20;
               this.npcBtnArray[_loc2_].enabled = true;
               this.npcBtnArray[_loc2_].filters = null;
               if(!this.npcBtnArray[_loc2_].hasEventListener(MouseEvent.CLICK))
               {
                  this.npcBtnArray[_loc2_].addEventListener(MouseEvent.CLICK,this.onNpcClick);
               }
            }
            _loc2_++;
         }
      }
      
      private function removeZhanHun() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:DisplayObject = null;
         while(this.container.numChildren > 0)
         {
            _loc1_ = this.container.removeChildAt(0);
            if(_loc1_ is Sprite)
            {
               _loc2_ = (_loc1_ as Sprite).getChildAt(0);
               if(_loc2_ is ItemFace)
               {
                  this.onComItemFace(_loc2_);
               }
            }
         }
      }
      
      public function setZhanHun(param1:Array) : void
      {
         this.removeZhanHun();
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         this.dictZhanHun = new Dictionary();
         this.zhanHunArr = new Array();
         this.zhanHunArr = param1;
         var _loc2_:* = 0;
         while(_loc2_ < param1.length)
         {
            this.addZhanHunToStage(_loc2_,param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function setData(param1:Array, param2:Array, param3:int, param4:Number) : void
      {
         this.zhanhunArray = new Array();
         this.zhanhunArray = param2;
         this.npcArr = new Array();
         this.npcArr = param1;
         this.setNpcBtnStatus(param1);
         this.setZhanHun(param2);
         this.setJiFen(param3);
         this.setTongBi(param4);
      }
      
      public function addZhanHun(param1:Array, param2:Array, param3:int) : void
      {
         var _loc7_:String = null;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc4_:String = new String();
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            this.addZhanHunToStage(this.zhanHunArr.length,param1[_loc5_]);
            this.zhanHunArr.push(param1[_loc5_]);
            _loc4_ = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("你获得了") + "“</font>";
            _loc7_ = StaticValue.HUISE_HTML;
            if(param1[_loc5_].type == 2)
            {
               _loc7_ = StaticValue.WHITE_HTML;
            }
            else if(param1[_loc5_].type == 3)
            {
               _loc7_ = StaticValue.BLUE_HTML;
            }
            else if(param1[_loc5_].type == 4)
            {
               _loc7_ = StaticValue.GREEN_HTML;
            }
            else if(param1[_loc5_].type == 5)
            {
               _loc7_ = StaticValue.PURPLE50_HTML;
            }
            else if(param1[_loc5_].type == 6)
            {
               _loc7_ = StaticValue.GOLD_HTML;
            }
            _loc4_ += "<font color=\'" + _loc7_ + "\'>" + param1[_loc5_].name + "</font> <font color=\'" + StaticValue.GREEN_HTML + "\'>" + "”";
            _loc5_++;
         }
         var _loc6_:* = 4;
         _loc6_ = int(param2.length - 1);
         while(_loc6_ >= 0)
         {
            if(param2[_loc6_].state == 1)
            {
               break;
            }
            _loc6_--;
         }
         if(_loc6_ > this.clickNpcIndex)
         {
            _loc4_ += "," + LanResManager.getLanCommonTextWords("并遇到了") + this.npcArr[_loc6_].name + "</font>";
         }
         this.setNpcBtnStatus(param2);
         this.showPopTip(this.npcBtnArray[this.clickNpcIndex].x,this.npcBtnArray[this.clickNpcIndex].y,_loc4_);
      }
      
      public function deleteZhanHun(param1:Array) : *
      {
         var tempX:int;
         var tempY:int;
         var i:*;
         var tmpItem:DisplayObject = null;
         var m:int = 0;
         var popTip:FTextArea = null;
         var arr:Array = param1;
         if(arr == null || arr.length == 0)
         {
            return;
         }
         tempX = 0;
         tempY = 0;
         i = 0;
         while(i < arr.length)
         {
            if(this.dictZhanHun[arr[i].id] != null)
            {
               tmpItem = this.dictZhanHun[arr[i].id].getChildAt(0);
               this.container.removeChild(this.dictZhanHun[arr[i].id]);
               tempX = int(this.dictZhanHun[arr[i].id].x);
               tempY = int(this.dictZhanHun[arr[i].id].y);
               delete this.dictZhanHun[arr[i].id];
               m = 0;
               while(m < this.zhanHunArr.length)
               {
                  if(arr[i].id == this.zhanHunArr[m].id)
                  {
                     this.zhanHunArr.splice(m,1);
                  }
                  m++;
               }
               tmpItem.x = tempX + 5;
               tmpItem.y = tempY + 3.5;
               if(arr[i].type == "sell")
               {
                  (tmpItem as ItemFace).setMcName(false,false);
                  tempX = tmpItem.x - 0.4 * tmpItem.width / 2;
                  tempY = tmpItem.y - 0.4 * tmpItem.height / 2;
                  addChild(tmpItem);
                  TweenMax.to(tmpItem,1.5,{
                     "x":tempX,
                     "y":tempY,
                     "autoAlpha":0,
                     "scaleX":1.4,
                     "scaleY":1.4,
                     "onComplete":this.onComItemFace,
                     "onCompleteParams":[tmpItem]
                  });
                  popTip = new FTextArea();
                  with(popTip)
                  {
                     
                     filters = StaticValue.filter;
                     autoSize = TextFieldAutoSize.CENTER;
                     x = tempX - 20;
                     y = tempY + 40;
                     textColor = StaticValue.GREEN;
                     width = 132;
                  }
                  addChild(popTip);
                  popTip.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("获得了") + arr[i].price + LanResManager.getLanCommonTextWords("铜币") + "</font><br>";
                  TweenMax.to(popTip,2,{
                     "autoAlpha":0,
                     "y":tempY - 30,
                     "onComplete":this.onCom,
                     "onCompleteParams":[popTip]
                  });
               }
               else
               {
                  tmpItem.removeEventListener(MouseEvent.CLICK,this.onShiQuClick);
                  addChild(tmpItem);
                  TweenMax.to(tmpItem,1.5,{
                     "x":650,
                     "y":260,
                     "delay":i * 0.1,
                     "onComplete":this.onComItemFace,
                     "onCompleteParams":[tmpItem]
                  });
               }
            }
            i++;
         }
         this.sortZhanHun();
      }
      
      public function showPopTip(param1:int, param2:int, param3:String) : void
      {
         var x1:int = param1;
         var y1:int = param2;
         var str:String = param3;
         var ftaw1:FTextArea = new FTextArea();
         with(ftaw1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = x1;
            y = y1;
            textColor = StaticValue.YELLOW;
         }
         ftaw1.htmlText = str;
         addChild(ftaw1);
         TweenMax.to(ftaw1,2,{
            "autoAlpha":0,
            "y":y1 - 60,
            "onComplete":this.onCom,
            "onCompleteParams":[ftaw1]
         });
      }
      
      public function showBaoshiCanvas0() : void
      {
         this.DuihuanPanel.showBaoshiCanvas();
      }
      
      public function setDuiHuanbaoshi0(param1:Array, param2:int) : void
      {
         this.DuihuanPanel.setDuiHuanbaoshi(param1,param2);
      }
      
      public function setYeShu(param1:int, param2:int) : void
      {
         this.DuihuanPanel.setYeshu(param1,param2);
      }
      
      public function showZhanhunCanvas0() : void
      {
         this.DuihuanPanel.showZhanhunCanvas();
      }
      
      public function setDuiHuanzhanhun0(param1:Array, param2:int) : void
      {
         this.DuihuanPanel.setDuiHuanzhanhun(param1,param2);
      }
   }
}

