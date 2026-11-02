package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class Dongxiao extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      public var img:Bitmap;
      
      private var img1:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var fta:FTextArea;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var check1:FCheckBox;
      
      private var lb:FLabel;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var fta1:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var tf:TextFormat;
      
      private var TssdBtn:SmallButton;
      
      private var loadUrl:String;
      
      private var jianshuContainer:Sprite;
      
      private var xldjBar:ColorBar;
      
      private var dengjiId:int;
      
      private var check:FCheckBox;
      
      private var ycsx:FTextArea;
      
      private var mcObj:Object;
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var tootips1:String = "";
      
      private var zhanyinSp:Sprite;
      
      private var fts1:FTextArea;
      
      private var zanghuayin:Boolean = false;
      
      private var lixuangong:Boolean = false;
      
      private var shuangshenghen:Boolean = false;
      
      private var anhunqu:Boolean = false;
      
      private var xuanyinqu:Boolean = false;
      
      private var moyinzhang:Boolean = false;
      
      private var fts2:FTextArea;
      
      public function Dongxiao()
      {
         var bg:Bitmap;
         this.mcObj = {};
         super();
         this.img = new Bitmap();
         this.img.name = "ui.dongxiao.ui";
         addChild(this.img);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 8;
         this.gongMcSpr.y = 12;
         addChild(this.gongMcSpr);
         bg = StaticValue.getBitmapByClassName("ui.dongxiao.kuang");
         bg.x = 8;
         bg.y = 8;
         addChild(bg);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 90;
            x = 10;
            y = 160 - 4;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta = new FTextArea();
         with(this.fta)
         {
            wordWrap = true;
            filters = StaticValue.filter;
            width = 230;
            height = 170;
            x = 170;
            y = 15;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"漫漫江湖箫声相伴箫在",[StaticValue.ORANGE_HTML,StaticValue.SKY_BLUE_HTML]) + "</textformat>";
         }
         addChild(this.fta);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 240 - 70;
         this.check1.y = 106 + 62;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 265 - 70;
            y = 170;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("开启洞箫使用");
         }
         addChild(this.lb);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 55 - 2 - 2 - 3;
         this.check.y = 125 + 2;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 70 - 2 - 3;
            y = 125 + 3 + 1;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("外观显示");
         }
         addChild(this.lb);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 239 + 60 - 26;
         this.previousButton.y = 135 - 26 + 45 + 15;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 64;
            height = 16;
            x = 260 + 60 - 26;
            y = 135 - 26 + 45 + 15;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = "";
         }
         addChild(this.fta3);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 297 + 60 - 26 + 30;
         this.nextButton.y = 135 - 26 + 45 + 15;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 170;
            y = 137 + 55;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("修炼进度");
         }
         addChild(this.lb);
         this.img1 = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(this.img1);
         this.img1.width = 105;
         this.img1.x = 230 - 5;
         this.img1.y = 209 - 18;
         this.xldjBar = new ColorBar(1,80,11);
         addChild(this.xldjBar);
         this.xldjBar.x = 245 - 7;
         this.xldjBar.y = 212 - 18;
         this.TssdBtn = new SmallButton();
         this.TssdBtn.label = LanResManager.getLanCommonTextWords("提升速度");
         addChild(this.TssdBtn);
         this.TssdBtn.x = 341 - 10;
         this.TssdBtn.y = 137 + 54;
         this.TssdBtn.addEventListener(MouseEvent.MOUSE_UP,this.onBtnClick);
         this.TssdBtn.enabled = false;
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            wordWrap = true;
            filters = StaticValue.filter;
            width = 230;
            height = 80;
            x = 170;
            y = 135 + 75;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.fta5);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 230;
            height = 20;
            x = 10;
            y = 323 - 18;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("洞箫技能");
         }
         addChild(this.fta);
         this.ycsx = new FTextArea();
         with(this.ycsx)
         {
            filters = StaticValue.filter;
            width = 290;
            height = 20;
            x = 110;
            y = 323 - 18;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("隐藏属性：");
         }
         addChild(this.ycsx);
         this.jianshuContainer = new Sprite();
         addChild(this.jianshuContainer);
         this.jianshuContainer.x = 39 - 16;
         this.jianshuContainer.y = 323;
         this.fta8 = new FTextArea();
         with(this.fta8)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 102 - 23;
            y = 172;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanTextWords(this,"顶级激活进度：");
         }
         addChild(this.fta8);
         this.fta8.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.fta8.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         this.fta9 = new FTextArea();
         with(this.fta9)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 133 - 23;
            y = 189;
            textColor = StaticValue.RED;
            htmlText = "";
         }
         addChild(this.fta9);
         this.zhanyinSp = new Sprite();
         with(this.zhanyinSp.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,31,37);
            endFill();
         }
         this.zhanyinSp.x = 365;
         this.zhanyinSp.y = 324;
         this.fts1 = new FTextArea();
         this.fts1.x = 17;
         this.fts1.y = 20;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("黄金洞箫秘籍（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("双击使用后改变自身洞箫外观为赤金长箫") + "<br></font>";
            _loc1_ += "</textformat>";
            if(zanghuayin)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("葬花吟秘籍 ：被攻击时有几率触发10秒抵抗所有百分比掉血效果") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(lixuangong)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("离玄功秘籍 ：被攻击时有几率触发10秒抵抗所有无视防御效果。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(shuangshenghen)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("双声恨秘籍 ：被攻击时有几率触发10秒抵抗所有沉睡效果。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(anhunqu)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("安魂曲秘籍 ：被攻击时有几率触发10秒抵抗所有混乱效果。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(xuanyinqu)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("玄阴曲秘籍 ：被攻击时有几率触发10秒抵抗所有禁跳效果。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(moyinzhang)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("魔音障秘籍：攻击时有几率触发对5格范围内全部玩家击飞且眩晕3秒。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            return _loc1_;
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 17;
         this.fts2.y = 40;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 110 + 30;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("订制专属技能卡(已激活)");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击10888888889000 防御8888888889000 血量12888888889000") + "<br>" + LanResManager.getLanCommonTextWords("暴击88888闪避88888 所有武功2800000层") + "<br>" + LanResManager.getLanCommonTextWords("专属霸权：攻击时100%触发专属霸权，持续10秒；自身在此状态下，每跳跃至对手身边，对") + "<br>" + LanResManager.getLanCommonTextWords("手都将被自身踩入地底下，持续10秒；且在地底下对手，将无法动弹，所有能力下降至1%，") + "<br>" + LanResManager.getLanCommonTextWords("每秒受到地灵的侵蚀持续掉血60%。") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.fta8.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip1(this.tootips1);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.fta8.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function showTip1(param1:String) : void
      {
         this.tip.htmlText = param1;
         Tools.currentStage.addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = Tools.currentStage.mouseX + 15;
         this.tipCanvas.y = Tools.currentStage.mouseY + 25;
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target.label)
         {
            case LanResManager.getLanCommonTextWords("提升速度"):
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAO_TISHENGSUDU_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("突破瓶颈"):
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAO_TUPOPINGJING_CLICK));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAO_FANYE_CLICK,"",-1));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAO_FANYE_CLICK,"",1));
         }
         switch(param1.currentTarget)
         {
            case this.check1:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAO_SHIFOUSHIYONGANQI_CLICK,"",this.check1.selectState ? 1 : 0));
               break;
            case this.check:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DONGXIAO_SHIFOUSHIXIANSHI_CLICK,"",this.check.selectState));
         }
      }
      
      public function setDengji(param1:String) : void
      {
         this.fta3.htmlText = param1;
      }
      
      public function setJindu(param1:int, param2:int, param3:Boolean) : void
      {
         this.dengjiId = param1;
         this.xldjBar.setValue(param1,param2);
         this.TssdBtn.label = LanResManager.getLanCommonTextWords("提升速度");
         this.TssdBtn.enabled = true;
         if(param1 == param2)
         {
            if(param3)
            {
               this.TssdBtn.label = LanResManager.getLanCommonTextWords("突破瓶颈");
            }
            else
            {
               this.TssdBtn.label = LanResManager.getLanCommonTextWords("已达成");
            }
         }
         this.TssdBtn.enabled = param3;
      }
      
      public function setJianshu(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:int = 0;
         while(this.jianshuContainer.numChildren > 0)
         {
            this.jianshuContainer.removeChildAt(0);
         }
         while(_loc3_ < param1.length)
         {
            _loc2_ = new ItemFace(param1[_loc3_]);
            _loc2_.showKungFuTag();
            _loc2_.setShowCount(false);
            _loc2_.x = _loc3_ * 51;
            this.jianshuContainer.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setShuxing(param1:String, param2:int, param3:int, param4:Array) : void
      {
         var i:int = 0;
         var str1:String = param1;
         var int1:int = param2;
         var int2:int = param3;
         var ar:Array = param4;
         var str:String = "";
         str = "<textformat leading=\'1\'>" + LanResManager.getLanCommonTextWords("洞箫名称：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + str1 + "</font>" + "<br>" + LanResManager.getLanCommonTextWords("当前段位：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + int1 + LanResManager.getLanCommonTextWords("段") + "</font>" + "<br>" + LanResManager.getLanCommonTextWords("当前等级：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + int2 + LanResManager.getLanCommonTextWords("级") + "</font>" + "<br>" + LanResManager.getLanCommonTextWords("携带后增加人物属性") + "<br>";
         while(i < ar.length)
         {
            if(i == 0 && ar[0] != 0)
            {
               str += LanResManager.getLanCommonTextWords("增加人物攻击") + "" + ar[0] + "<br>";
            }
            else if(i == 1 && ar[1] != 0)
            {
               str += LanResManager.getLanCommonTextWords("增加人物防御") + " " + ar[1] + "<br>";
            }
            else if(i == 2 && ar[2] != 0)
            {
               str += LanResManager.getLanCommonTextWords("增加生命上限") + "" + ar[2] + "<br>";
            }
            else if(i == 3 && ar[3] != 0)
            {
               str += LanResManager.getLanCommonTextWords("增加人物内力") + "" + ar[3] + "<br>";
            }
            else if(i == 4 && ar[4] != 0)
            {
               str += LanResManager.getLanCommonTextWords("增加人物体力") + "" + ar[4] + "<br>";
            }
            i++;
         }
         str += "</textformat>";
         this.fta1.htmlText = str;
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/dongxiao/" + int1 + ".swf";
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
         if(this.mcObj[int1] != null)
         {
            this.gongMc = this.mcObj[int1];
            this.gongMc.play();
            this.gongMcSpr.addChild(this.gongMc);
         }
         else
         {
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(gongMc) && gongMc.parent != null)
               {
                  gongMc.stop();
                  gongMc.parent.removeChild(gongMc);
               }
               while(gongMcSpr.numChildren > 0)
               {
                  gongMcSpr.removeChildAt(0);
               }
               gongMc = _loc2_.content as MovieClip;
               mcObj[int1] = gongMc;
               if(gongMc)
               {
                  gongMcSpr.addChild(gongMc);
               }
            },null,false,this.loadUrl);
         }
      }
      
      public function setMiaoshu(param1:String) : void
      {
         this.fta5.htmlText = "<textformat leading=\'0.5\'>" + param1 + "</textformat>";
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
      }
      
      public function setUse(param1:Boolean) : void
      {
         this.check1.selectState = param1;
      }
      
      public function setShow(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function setDongxiaoEnabledFun() : void
      {
         this.TssdBtn.enabled = false;
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.check1.enabled = false;
         this.check.enabled = false;
      }
      
      public function setYCSX(param1:int) : void
      {
         if(param1 == 1)
         {
            this.ycsx.htmlText = LanResManager.getLanCommonTextWords("隐藏属性：（已激活） 人物攻击力+5000");
         }
         else
         {
            this.ycsx.htmlText = LanResManager.getLanCommonTextWords("隐藏属性：（未激活）");
         }
      }
      
      public function menuToolTip(param1:String) : void
      {
         this.tootips1 = param1;
      }
      
      public function setJinduNum(param1:int, param2:Boolean) : void
      {
         if(param2)
         {
            this.fta8.visible = true;
            this.fta9.visible = true;
         }
         else
         {
            this.fta8.visible = false;
            this.fta9.visible = false;
         }
         this.fta9.htmlText = param1 + "%";
      }
      
      public function setZhanyin(param1:Boolean) : void
      {
         var zhanyinBt:DisplayObject = null;
         var color:String = null;
         var bo:Boolean = param1;
         var t:int = 0;
         color = "";
         while(this.zhanyinSp.numChildren > 0)
         {
            this.zhanyinSp.removeChildAt(0);
         }
         if(bo)
         {
            t = 1;
            color = StaticValue.RED_HTML;
         }
         else
         {
            t = 2;
            color = StaticValue.HUISE_HTML;
         }
         zhanyinBt = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/dongxiao/" + t + ".swf");
         zhanyinBt.x = 0;
         zhanyinBt.y = 0;
         this.zhanyinSp.addChild(zhanyinBt);
         ToolTips.createToolTips(zhanyinBt,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'" + color + "\'>" + LanResManager.getLanCommonTextWords("羌笛战音：") + "<br>" + LanResManager.getLanCommonTextWords("增加人物攻击4688888、防御 3888888、血量38888888 、暴击 5888、闪避5888") + "<br>" + LanResManager.getLanCommonTextWords("及所有武功提升十层，并提高对所有弓箭技能抗性30%.");
            _loc1_ += "</font>";
            return _loc1_ + "</textformat>";
         });
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.DONGXIAO_HUANGJINGDONGXIAO_ID];
            this.zanghuayin = GameState.dictMainStatus[SpecialGoodsID.DONGXIAO_ZANGHUAYIN];
            this.lixuangong = GameState.dictMainStatus[SpecialGoodsID.DONGXIAO_LIXUANGONG];
            this.shuangshenghen = GameState.dictMainStatus[SpecialGoodsID.DONGXIAO_SHUANGSHENGHEN];
            this.anhunqu = GameState.dictMainStatus[SpecialGoodsID.DONGXIAO_ANHUNQU];
            this.xuanyinqu = GameState.dictMainStatus[SpecialGoodsID.DONGXIAO_XUANYINQU];
            this.moyinzhang = GameState.dictMainStatus[SpecialGoodsID.DONGXIAO_MOYINZHANG];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.DONGXIAO_ZHUANSHU_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.BOW_KUANGHUA];
            this.zanghuayin = GameState.dictTargetStatus[SpecialGoodsID.DONGXIAO_ZANGHUAYIN];
            this.lixuangong = GameState.dictTargetStatus[SpecialGoodsID.DONGXIAO_LIXUANGONG];
            this.shuangshenghen = GameState.dictTargetStatus[SpecialGoodsID.DONGXIAO_SHUANGSHENGHEN];
            this.anhunqu = GameState.dictTargetStatus[SpecialGoodsID.DONGXIAO_ANHUNQU];
            this.xuanyinqu = GameState.dictTargetStatus[SpecialGoodsID.DONGXIAO_XUANYINQU];
            this.moyinzhang = GameState.dictTargetStatus[SpecialGoodsID.DONGXIAO_MOYINZHANG];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.DONGXIAO_ZHUANSHU_ID];
         }
      }
   }
}

