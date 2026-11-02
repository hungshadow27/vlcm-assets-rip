package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FAlertEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.loader.vo.LoadData;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.Dictionary;
   import gs.TweenMax;
   
   public class Dantian extends Sprite
   {
      
      public static const UI_DANTIAN_GUANBI_CLICK:String = "UI_DANTIAN_GUANBI_CLICK";
      
      public var bgImg:Bitmap;
      
      public var _parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var shuxingFta:FTextArea;
      
      private var skillFta:FTextArea;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var count:FTextArea;
      
      private var tf:TextFormat;
      
      public var djtpBtn:SecondButton;
      
      private var jianshuContainer:Sprite;
      
      private var dengji:int;
      
      private var dantiantupoCanvas:DantianTupoCanvas;
      
      private var currSkill:ItemFace;
      
      private var p:Point;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var str1:String;
      
      private var str2:String;
      
      private var str3:String;
      
      private var gongMcSpr1:Sprite;
      
      private var gongMc1:MovieClip;
      
      private var gongMc2:MovieClip;
      
      private var gongMc3:MovieClip;
      
      private var gongMc4:MovieClip;
      
      private var gongMc5:MovieClip;
      
      private var loadUrl1:String;
      
      private var loadUrl2:String;
      
      private var loadUrl3:String;
      
      private var loadUrl4:String;
      
      private var loadUrl5:String;
      
      public var zhufuzhi:int;
      
      private var yanhuaMc:MovieClip;
      
      private var LeftBo1:Boolean;
      
      private var LeftBo2:Boolean;
      
      private var buffSpr:Sprite;
      
      private var buffSpr2:Sprite;
      
      private var jihuoBtn:SecondButton;
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var tootips1:String = "";
      
      private var xinFaSpr:Sprite;
      
      private var jihuoDantianJinjieBtn:SecondButton;
      
      private var jihuoFt:FTextArea;
      
      private var dantianJinjieFt:FTextArea;
      
      private var boo:Boolean = true;
      
      private var leftmcDic:Dictionary;
      
      private var rightmcDic:Dictionary;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var isMainchar:Boolean = true;
      
      private var aoyijindu:int = 0;
      
      private var fts3:FTextArea;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var kuang:Bitmap;
      
      private var gooditem:ItemFace;
      
      private var fts4:FTextArea;
      
      private var ynchk_sdxn:FCheckBox;
      
      private var ynchk:FCheckBox;
      
      private var ynKuang:Bitmap;
      
      private var ynEquip:Sprite;
      
      private var ft_ynsdxn:FTextArea;
      
      private var ft_yntjly:FTextArea;
      
      private var ynItemSpr:Sprite;
      
      private var isLockOn:Boolean = false;
      
      public function Dantian()
      {
         var $mask:Sprite;
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.char.dantian.ui";
         addChild(this.bgImg);
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
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 160;
            height = 100;
            wordWrap = true;
            x = 3;
            y = 5;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanTextWords(this,"丹田乃大乘武学之基石");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            width = 160;
            height = 100;
            wordWrap = true;
            x = 3;
            y = 145;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"丹田修炼等级：");
         }
         addChild(this.fta);
         this.xinFaSpr = new Sprite();
         this.xinFaSpr.x = 137;
         this.xinFaSpr.y = 184;
         addChild(this.xinFaSpr);
         this.buffSpr = new Sprite();
         this.buffSpr.x = 137 + 217;
         this.buffSpr.y = 184;
         addChild(this.buffSpr);
         this.buffSpr2 = new Sprite();
         this.buffSpr2.x = 2;
         this.buffSpr2.y = 184;
         addChild(this.buffSpr2);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 34;
         this.previousButton.y = 165;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FTextArea();
         with(this.count)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 64;
            height = 16;
            x = 55;
            y = 166;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            text = LanResManager.getLanCommonTextWords("一级【乾】");
         }
         addChild(this.count);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 122;
         this.nextButton.y = 165;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.djtpBtn = new SecondButton();
         this.djtpBtn.label = LanResManager.getLanCommonTextWords("等级突破");
         addChild(this.djtpBtn);
         this.djtpBtn.x = 54 - 28;
         this.djtpBtn.y = 193;
         this.djtpBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 3;
            y = 222;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"丹田等级带来的人物属性加成：");
         }
         addChild(this.fta);
         this.shuxingFta = new FTextArea();
         with(this.shuxingFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 3;
            y = 241;
            textColor = StaticValue.BlUE50;
            htmlText = "";
         }
         addChild(this.shuxingFta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 3;
            y = 260;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"丹田等级带来的武学层数加成：");
         }
         addChild(this.fta);
         this.skillFta = new FTextArea();
         with(this.skillFta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 3;
            y = 280;
            textColor = StaticValue.BlUE50;
            htmlText = "";
         }
         addChild(this.skillFta);
         this.skillFta.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip4);
         this.skillFta.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip4);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 3;
            y = 304;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,"丹田等级对应可学新武学（需秘籍书）：");
         }
         addChild(this.fta);
         this.jianshuContainer = new Sprite();
         addChild(this.jianshuContainer);
         with(this.jianshuContainer)
         {
            x = 11;
            y = 323;
         }
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.dantiantupoCanvas = new DantianTupoCanvas();
         addChild(this.dantiantupoCanvas);
         this.dantiantupoCanvas.x = -10;
         this.dantiantupoCanvas.y = 380;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = -10;
         $mask.y = 270;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,425,110);
            endFill();
         }
         this.dantiantupoCanvas.mask = $mask;
         this.gongMcSpr1 = new Sprite();
         this.gongMcSpr1.x = 10;
         this.gongMcSpr1.y = 60;
         addChild(this.gongMcSpr1);
         this.gongMcSpr1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.gongMcSpr1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         addEventListener(UI_DANTIAN_GUANBI_CLICK,this.aa1);
         this.jihuoBtn = new SecondButton();
         this.jihuoBtn.label = LanResManager.getLanCommonTextWords("激活隐藏属性");
         addChild(this.jihuoBtn);
         this.jihuoBtn.x = 300;
         this.jihuoBtn.y = 5;
         this.jihuoBtn.addEventListener(MouseEvent.CLICK,this.onJiHuoBtnClick);
         this.jihuoDantianJinjieBtn = new SecondButton();
         this.jihuoDantianJinjieBtn.label = LanResManager.getLanCommonTextWords("激活丹田进阶");
         this.jihuoDantianJinjieBtn.x = 175;
         this.jihuoDantianJinjieBtn.y = 5;
         this.jihuoDantianJinjieBtn.addEventListener(MouseEvent.CLICK,this.onJiHuoDantianJinjieBtnClick);
         this.jihuoFt = new FTextArea();
         this.jihuoFt.x = 265;
         this.jihuoFt.y = 5;
         this.jihuoFt.autoSize = TextFieldAutoSize.LEFT;
         this.jihuoFt.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性已激活") + "</font>";
         this.jihuoFt.visible = false;
         addChild(this.jihuoFt);
         this.dantianJinjieFt = new FTextArea();
         this.dantianJinjieFt.x = 175;
         this.dantianJinjieFt.y = 5;
         this.dantianJinjieFt.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("丹田进阶已激活") + "</font>";
         this.dantianJinjieFt.visible = false;
         this.fta8 = new FTextArea();
         with(this.fta8)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 90;
            y = 118;
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
            x = 121;
            y = 135;
            textColor = StaticValue.RED;
            htmlText = "";
         }
         addChild(this.fta9);
         this.fts1 = new FTextArea();
         this.fts1.x = 5 + 170;
         this.fts1.y = 7 + 195;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 50;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当提升100次后，可以激活梦幻丹田终极神技“缚神术”：攻击时有几率触发，命中对手后使对手在30秒内无法使用凌波微步技能。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 175;
         this.fts2.y = 25;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("丹田觉醒（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击488888888890  防御268000000000  血量488888888888  暴击88888  闪避88888") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：青龙战纹5%、朱雀战纹4%、白虎战纹5% 所有武功提升88888层") + "<br>" + LanResManager.getLanCommonTextWords("（特殊技能）当被命中定身时必定触发丹田觉醒，丹田觉醒将以人物十倍伤害的攻击效果对对手发起攻击") + "<br>" + LanResManager.getLanCommonTextWords("并且每次攻击都必定使对手无法跳跃，丹田觉醒护主将置之死地而后生！") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 175;
         this.fts3.y = 50 + 20;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("精灵召唤石");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("精灵召唤（特殊技能）：开启精灵召唤，可从次元中呼唤精灵在人物旁边飞翔，且攻击时有几率") + "<br>" + LanResManager.getLanCommonTextWords("召唤出精灵侵蚀效果，令对手无法移动，只能跳跃，且对手受精灵侵蚀，全身勋章失效持续5秒") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 175;
         this.check.y = 75 + 15;
         this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 20;
            --check.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 175;
         this.kuang.y = 100 + 15;
         this.rightmcDic = new Dictionary();
         this.leftmcDic = new Dictionary();
         this.fts4 = new FTextArea();
         this.fts4.x = 175;
         this.fts4.y = 50 + 20 + 40 + 30 + 15;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("烟消云散秘籍");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + LanResManager.getLanCommonTextWords("烟消无散（特殊技能）：攻击时100%触发烟消无散，持续10秒；可瞬间将骑乘在坐骑") + "<br>" + LanResManager.getLanCommonTextWords("上的对手打飞，消失在视野当中；被打飞的对手只留下一只坐骑在原地，且坐骑因惊") + "<br>" + LanResManager.getLanCommonTextWords("恐过度，瞬间退化成最原始的的卢马。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ynEquip = new Sprite();
         with(this.ynEquip.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,220,80);
            endFill();
         }
         this.ynEquip.x = 352 - 90;
         this.ynEquip.y = 182;
         addChild(this.ynEquip);
         this.ynEquip.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.ynchk = new FCheckBox();
         this.ynchk.name = "1";
         this.ynEquip.addChild(this.ynchk);
         this.ynchk.textColor = StaticValue.WHITE;
         this.ynchk.x = 35;
         this.ynchk.y = 42;
         this.ynchk.addEventListener(MouseEvent.CLICK,this.onCheckClickYN);
         this.ft_yntjly = new FTextArea();
         this.ft_yntjly.x = 35 + 20;
         this.ft_yntjly.y = 42;
         this.ft_yntjly.width = 65;
         this.ft_yntjly.textColor = StaticValue.WHITE;
         this.ft_yntjly.htmlText = LanResManager.getLanCommonTextWords("太极气旋");
         this.ynEquip.addChild(this.ft_yntjly);
         this.ynchk_sdxn = new FCheckBox();
         this.ynchk_sdxn.name = "2";
         this.ynEquip.addChild(this.ynchk_sdxn);
         this.ynchk_sdxn.textColor = StaticValue.WHITE;
         this.ynchk_sdxn.x = 35 - 95;
         this.ynchk_sdxn.y = 42;
         this.ynchk_sdxn.addEventListener(MouseEvent.CLICK,this.onCheckClickYN);
         this.ft_ynsdxn = new FTextArea();
         this.ft_ynsdxn.x = 35 - 95 + 20;
         this.ft_ynsdxn.y = 42;
         this.ft_ynsdxn.width = 65;
         this.ft_ynsdxn.textColor = StaticValue.WHITE;
         this.ft_ynsdxn.htmlText = LanResManager.getLanCommonTextWords("神雕气旋");
         this.ynEquip.addChild(this.ft_ynsdxn);
         this.ynKuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.ynKuang.x = 88;
         this.ynKuang.y = 0;
         this.ynEquip.addChild(this.ynKuang);
         this.ynItemSpr = new Sprite();
         this.ynEquip.addChild(this.ynItemSpr);
      }
      
      public function get useDantianGoodsType() : int
      {
         return this.dantiantupoCanvas.useDantianGoodsType;
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,6]));
      }
      
      private function onCheckClickYN(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.ynchk:
            case this.ynchk_sdxn:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YUENANDINGZHI_QIXUAN_ZIDONGHUANZHUANG,"",[param1.target.selectState,param1.target.name]));
               param1.target.selectState = false;
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isLockOn)
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onJiHuoBtnClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_JIHUO_CLICK));
      }
      
      private function onJiHuoDantianJinjieBtnClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIANJINJIE_JIHUO_CLICK));
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         var str:String = null;
         var e:BaseEvent = param1;
         if(this.zhufuzhi > 0)
         {
            str = "";
            str = LanResManager.getLanTextWords(this,"丹田突破祝福值重要提示：",[StaticValue.RED_HTML,StaticValue.GREEN_HTML,StaticValue.RED_HTML,this.zhufuzhi]);
            str += e.data;
            FAlert.okLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("继续突破");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_CLOSE));
                  onShowLv(false);
               }
            });
         }
         else
         {
            this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_CLOSE));
            this.onShowLv(false);
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
         this.dantiantupoCanvas.$parent = this._parent;
         this.dantiantupoCanvas.$parent2 = this;
      }
      
      private function onCom() : void
      {
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
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.gongMcSpr1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = LanResManager.getLanTextWords(this,"第一气旋：",[StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML,StaticValue.PURPLE_HTML]);
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.gongMcSpr1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
         }
      }
      
      private function onMouseTip4(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.skillFta.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = this.skillFta.getCharIndexAtPoint(this.skillFta.mouseX,this.skillFta.mouseY);
               if(_loc2_ >= this.skillFta.text.indexOf(LanResManager.getLanCommonTextWords("所有门派武学")) && _loc2_ <= this.skillFta.text.indexOf(LanResManager.getLanCommonTextWords("所有门派武学")) + 5)
               {
                  this.showTip(this.str1);
               }
               else if(_loc2_ >= this.skillFta.text.indexOf(LanResManager.getLanCommonTextWords("所有江湖绝学")) && _loc2_ <= this.skillFta.text.indexOf(LanResManager.getLanCommonTextWords("所有江湖绝学")) + 5)
               {
                  this.showTip(this.str2);
               }
               else if(_loc2_ >= this.skillFta.text.indexOf(LanResManager.getLanCommonTextWords("所有其他绝学")) && _loc2_ <= this.skillFta.text.indexOf(LanResManager.getLanCommonTextWords("所有其他绝学")) + 5)
               {
                  this.showTip(this.str3);
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.skillFta.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip4);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_SKILL_DRAG_START,"",this.currSkill));
            }
            this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_XIAYIYE_CLICK));
               break;
            case this.djtpBtn:
               if(this.boo)
               {
                  this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_DENGJITUPO_CLICK));
               }
               else
               {
                  this._parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DANTIAN_JINJIE_CLICK));
               }
         }
      }
      
      private function com(param1:Event) : void
      {
         var _loc2_:LoadingItem = param1.target as LoadingItem;
         var _loc3_:String = _loc2_._id;
         if(_loc3_ == "gongMc3")
         {
            if(_loc2_.url.url != this.loadUrl3)
            {
               return;
            }
            if(this.gongMc3 != null && this.gongMc3.parent != null)
            {
               this.gongMc3.stop();
               this.gongMc3.parent.removeChild(this.gongMc3);
            }
            this.gongMc3 = _loc2_.content as MovieClip;
            if(this.gongMc3)
            {
               this.gongMc3.x = 199 + this.gongMc3.width / 2;
               this.gongMc3.y = -1 + this.gongMc3.height / 2;
               addChild(this.gongMc3);
               this.rightmcDic[this.loadUrl3] = this.gongMc3;
            }
         }
         else if(_loc3_ == "gongMc4")
         {
            if(_loc2_.url.url != this.loadUrl4)
            {
               return;
            }
            if(this.gongMc4 != null && this.gongMc4.parent != null)
            {
               this.gongMc4.stop();
               this.gongMc4.parent.removeChild(this.gongMc4);
            }
            this.gongMc4 = _loc2_.content as MovieClip;
            if(this.gongMc4)
            {
               this.gongMc4.x = 173 + this.gongMc4.width / 2;
               this.gongMc4.y = 40 + this.gongMc4.height / 2;
               addChild(this.gongMc4);
               this.rightmcDic[this.loadUrl4] = this.gongMc4;
            }
         }
         else if(_loc3_ == "gongMc5")
         {
            if(_loc2_.url.url != this.loadUrl5)
            {
               return;
            }
            if(this.gongMc5 != null && this.gongMc5.parent != null)
            {
               this.gongMc5.stop();
               this.gongMc5.parent.removeChild(this.gongMc5);
            }
            this.gongMc5 = _loc2_.content as MovieClip;
            if(this.gongMc5)
            {
               this.gongMc5.x = 176;
               this.gongMc5.y = 15;
               addChildAt(this.gongMc5,1);
               this.rightmcDic[this.loadUrl5] = this.gongMc5;
            }
         }
         else if(_loc3_ == "gongMc1")
         {
            if(_loc2_.url.url != this.loadUrl1)
            {
               return;
            }
            if(this.gongMc1 != null && this.gongMc1.parent != null)
            {
               this.gongMc1.stop();
               this.gongMc1.parent.removeChild(this.gongMc1);
            }
            this.gongMc1 = _loc2_.content as MovieClip;
            if(this.gongMc1)
            {
               this.gongMc1.x = 0;
               this.gongMc1.y = 0;
               this.gongMcSpr1.addChild(this.gongMc1);
               this.leftmcDic[this.loadUrl1] = this.gongMc1;
               if(this.LeftBo1)
               {
                  this.gongMc1.filters = [];
               }
               else
               {
                  this.gongMc1.gotoAndStop(1);
                  this.gongMc1.filters = Tools.blackWhiteFilter;
               }
            }
         }
         else if(_loc3_ == "gongMc2")
         {
            if(_loc2_.url.url != this.loadUrl2)
            {
               return;
            }
            if(this.gongMc2 != null && this.gongMc2.parent != null)
            {
               this.gongMc2.stop();
               this.gongMc2.parent.removeChild(this.gongMc2);
            }
            this.gongMc2 = _loc2_.content as MovieClip;
            if(this.gongMc2)
            {
               this.gongMc2.x = 52;
               this.gongMc2.y = 50;
               addChildAt(this.gongMc2,1);
               this.leftmcDic[this.loadUrl2] = this.gongMc2;
               if(this.LeftBo2)
               {
                  this.gongMc2.filters = [];
               }
               else
               {
                  this.gongMc2.gotoAndStop(1);
                  this.gongMc2.filters = Tools.blackWhiteFilter;
               }
            }
         }
      }
      
      private function setMcfromCache(param1:String, param2:String) : void
      {
         var _loc3_:String = param1;
         if(_loc3_ == "gongMc3")
         {
            if(this.gongMc3 != null && this.gongMc3.parent != null)
            {
               this.gongMc3.stop();
               this.gongMc3.parent.removeChild(this.gongMc3);
            }
            this.gongMc3 = this.rightmcDic[param2] as MovieClip;
            if(this.gongMc3)
            {
               this.gongMc3.x = 199 + this.gongMc3.width / 2;
               this.gongMc3.y = -1 + this.gongMc3.height / 2;
               this.gongMc3.play();
               addChild(this.gongMc3);
            }
         }
         else if(_loc3_ == "gongMc4")
         {
            if(this.gongMc4 != null && this.gongMc4.parent != null)
            {
               this.gongMc4.stop();
               this.gongMc4.parent.removeChild(this.gongMc4);
            }
            this.gongMc4 = this.rightmcDic[param2] as MovieClip;
            if(this.gongMc4)
            {
               this.gongMc4.x = 173 + this.gongMc4.width / 2;
               this.gongMc4.y = 40 + this.gongMc4.height / 2;
               this.gongMc4.play();
               addChild(this.gongMc4);
            }
         }
         else if(_loc3_ == "gongMc5")
         {
            if(this.gongMc5 != null && this.gongMc5.parent != null)
            {
               this.gongMc5.stop();
               this.gongMc5.parent.removeChild(this.gongMc5);
            }
            this.gongMc5 = this.rightmcDic[param2] as MovieClip;
            if(this.gongMc5)
            {
               this.gongMc5.x = 176;
               this.gongMc5.y = 15;
               this.gongMc5.play();
               addChildAt(this.gongMc5,1);
            }
         }
         else if(_loc3_ == "gongMc1")
         {
            if(this.gongMc1 != null && this.gongMc1.parent != null)
            {
               this.gongMc1.stop();
               this.gongMc1.parent.removeChild(this.gongMc1);
            }
            this.gongMc1 = this.leftmcDic[param2] as MovieClip;
            if(this.gongMc1)
            {
               this.gongMc1.x = 0;
               this.gongMc1.y = 0;
               this.gongMc1.play();
               this.gongMcSpr1.addChild(this.gongMc1);
               if(this.LeftBo1)
               {
                  this.gongMc1.filters = [];
               }
               else
               {
                  this.gongMc1.gotoAndStop(1);
                  this.gongMc1.filters = Tools.blackWhiteFilter;
               }
            }
         }
         else if(_loc3_ == "gongMc2")
         {
            if(this.gongMc2 != null && this.gongMc2.parent != null)
            {
               this.gongMc2.stop();
               this.gongMc2.parent.removeChild(this.gongMc2);
            }
            this.gongMc2 = this.leftmcDic[param2] as MovieClip;
            if(this.gongMc2)
            {
               this.gongMc2.x = 52;
               this.gongMc2.y = 50;
               addChildAt(this.gongMc2,1);
               this.gongMc2.play();
               if(this.LeftBo2)
               {
                  this.gongMc2.filters = [];
               }
               else
               {
                  this.gongMc2.gotoAndStop(1);
                  this.gongMc2.filters = Tools.blackWhiteFilter;
               }
            }
         }
      }
      
      public function setSkill(param1:Array) : void
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
            if(_loc3_ > 3)
            {
               _loc2_.x = _loc3_ * 49 + 1;
            }
            else
            {
               _loc2_.x = _loc3_ * 49;
            }
            this.jianshuContainer.addChild(_loc2_);
            _loc3_++;
         }
      }
      
      public function setShuxing(param1:Array, param2:Boolean) : void
      {
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if(param2)
            {
               if(this.dengji == 8)
               {
                  _loc3_ += param1[_loc4_] + "X3" + " ";
               }
               else
               {
                  _loc3_ += param1[_loc4_] + " ";
               }
            }
            else
            {
               _loc3_ += param1[_loc4_] + " ";
            }
            _loc4_++;
         }
         this.shuxingFta.htmlText = _loc3_;
         this.setJiHuo();
      }
      
      public function setWuxue(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         if(param4)
         {
            if(this.dengji == 8)
            {
               this.skillFta.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'><u>" + LanResManager.getLanCommonTextWords("所有门派武学") + "</u>：</font>+" + param1 + LanResManager.getLanCommonTextWords("层") + "X3" + " " + "<font color=\'" + StaticValue.GREEN_HTML + "\'><u>" + LanResManager.getLanCommonTextWords("所有江湖绝学") + "</u>：</font>+" + param2 + LanResManager.getLanCommonTextWords("层") + "X3 " + "<font color=\'" + StaticValue.GREEN_HTML + "\'><u>" + LanResManager.getLanCommonTextWords("所有其他绝学") + "</u>：</font>+" + param3 + LanResManager.getLanCommonTextWords("层") + "X3";
            }
            else
            {
               this.skillFta.htmlText = LanResManager.getLanTextWords(this,"所有门派武学江湖绝学其他绝学",[StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,param1,param2,param3]);
            }
         }
         else
         {
            this.skillFta.htmlText = LanResManager.getLanTextWords(this,"所有门派武学江湖绝学其他绝学",[StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,StaticValue.GREEN_HTML,param1,param2,param3]);
         }
      }
      
      public function setDengji(param1:int) : void
      {
         if(param1 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param1 == 8)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         this.dengji = param1;
         if(param1 == 1)
         {
            this.count.text = LanResManager.getLanCommonTextWords("一级【乾】");
         }
         else if(param1 == 2)
         {
            this.count.text = LanResManager.getLanCommonTextWords("二级【兑】");
         }
         else if(param1 == 3)
         {
            this.count.text = LanResManager.getLanCommonTextWords("三级【离】");
         }
         else if(param1 == 4)
         {
            this.count.text = LanResManager.getLanCommonTextWords("四级【震】");
         }
         else if(param1 == 5)
         {
            this.count.text = LanResManager.getLanCommonTextWords("五级【巽】");
         }
         else if(param1 == 6)
         {
            this.count.text = LanResManager.getLanCommonTextWords("六级【坎】");
         }
         else if(param1 == 7)
         {
            this.count.text = LanResManager.getLanCommonTextWords("七级【艮】");
         }
         else if(param1 == 8)
         {
            this.count.text = LanResManager.getLanCommonTextWords("八级【坤】");
         }
         else if(param1 < 1)
         {
            this.count.text = LanResManager.getLanCommonTextWords("一级【乾】");
         }
      }
      
      public function setRightMc(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(this.gongMc3 != null && this.gongMc3.parent != null)
         {
            this.gongMc3.stop();
            this.gongMc3.parent.removeChild(this.gongMc3);
         }
         if(this.gongMc4 != null && this.gongMc4.parent != null)
         {
            this.gongMc4.stop();
            this.gongMc4.parent.removeChild(this.gongMc4);
         }
         if(this.gongMc5 != null && this.gongMc5.parent != null)
         {
            this.gongMc5.stop();
            this.gongMc5.parent.removeChild(this.gongMc5);
         }
         this.loadUrl3 = GameConfig.fileBaseFolder + "res/data/mc/dantian/" + param1 + "/" + param2 + ".swf";
         this.loadUrl4 = GameConfig.fileBaseFolder + "res/data/mc/dantian/" + param3 + "/" + param4 + ".swf";
         this.loadUrl5 = GameConfig.fileBaseFolder + "res/data/mc/dantian/" + param2 + ".swf";
         var _loc5_:Array = new Array();
         if(this.rightmcDic[this.loadUrl3] != null)
         {
            this.setMcfromCache("gongMc3",this.loadUrl3);
         }
         else
         {
            _loc5_.push(new LoadData(this.loadUrl3,this.com,null,null,"","gongMc3"));
         }
         if(param3 != 0)
         {
            if(this.rightmcDic[this.loadUrl4] != null)
            {
               this.setMcfromCache("gongMc4",this.loadUrl4);
            }
            else
            {
               _loc5_.push(new LoadData(this.loadUrl4,this.com,null,null,"","gongMc4"));
            }
         }
         if(this.rightmcDic[this.loadUrl5] != null)
         {
            this.setMcfromCache("gongMc5",this.loadUrl5);
         }
         else
         {
            _loc5_.push(new LoadData(this.loadUrl5,this.com,null,null,"","gongMc5"));
         }
         if(_loc5_.length > 0)
         {
            LoaderManager.load(_loc5_);
         }
      }
      
      public function setLeftMc(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean) : void
      {
         this.LeftBo1 = param5;
         this.LeftBo2 = param6;
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         if(this.gongMc2 != null && this.gongMc2.parent != null)
         {
            this.gongMc2.stop();
            this.gongMc2.parent.removeChild(this.gongMc2);
         }
         this.loadUrl1 = GameConfig.fileBaseFolder + "res/data/mc/dantian/" + param1 + "/" + param2 + ".swf";
         this.loadUrl2 = GameConfig.fileBaseFolder + "res/data/mc/dantian/" + param3 + "/" + param4 + ".swf";
         var _loc7_:Array = new Array();
         if(param2 > 0)
         {
            if(this.leftmcDic[this.loadUrl1] != null)
            {
               this.setMcfromCache("gongMc1",this.loadUrl1);
            }
            else
            {
               _loc7_.push(new LoadData(this.loadUrl1,this.com,null,null,"","gongMc1"));
            }
         }
         if(param3 != 0)
         {
            if(this.leftmcDic[this.loadUrl2] != null)
            {
               this.setMcfromCache("gongMc2",this.loadUrl2);
            }
            else
            {
               _loc7_.push(new LoadData(this.loadUrl2,this.com,null,null,"","gongMc2"));
            }
         }
         if(_loc7_.length > 0)
         {
            LoaderManager.load(_loc7_);
         }
      }
      
      public function setZhufuzhi(param1:int, param2:int) : void
      {
         this.zhufuzhi = param1;
         this.dantiantupoCanvas.setZhufuzhi(param1,param2);
      }
      
      public function setRTime(param1:int) : void
      {
         this.dantiantupoCanvas.setRTime(param1);
      }
      
      public function setChenggonglv(param1:int, param2:int, param3:String, param4:Boolean) : void
      {
         this.dantiantupoCanvas.setChenggonglv(param1,param2,param3,param4);
      }
      
      public function setPudidan(param1:Goods) : void
      {
         this.dantiantupoCanvas.setPudidan(param1);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         this.dantiantupoCanvas.updateSuoxuCount();
         if(param1)
         {
            if(this.dantiantupoCanvas.y == 380)
            {
               TweenMax.to(this.dantiantupoCanvas,1,{
                  "y":273,
                  "onComplete":this.onCom
               });
            }
         }
         else if(this.dantiantupoCanvas.y == 273)
         {
            TweenMax.to(this.dantiantupoCanvas,1,{
               "y":380,
               "onComplete":this.onCom
            });
         }
      }
      
      public function setZdtsBtnLabel(param1:Boolean) : void
      {
         this.dantiantupoCanvas.setZdtsBtnLabel(param1);
      }
      
      public function setTupoBtnEnabled(param1:Boolean) : void
      {
         this.djtpBtn.enabled = param1;
      }
      
      public function setTishi(param1:Array, param2:Array, param3:Array) : void
      {
         this.str1 = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("门派武学包含：") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>";
         this.str2 = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("江湖绝学包含：") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>";
         this.str3 = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("其他绝学包含：") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>";
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            this.str1 += "[" + param1[_loc4_] + "]";
            if((_loc4_ + 1) % 4 == 0)
            {
               this.str1 += "<br>";
            }
            else if(_loc4_ != param1.length - 1)
            {
               this.str1 += "：";
            }
            _loc4_++;
         }
         this.str1 += "</font>";
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            this.str2 += "[" + param2[_loc4_] + "]";
            if((_loc4_ + 1) % 4 == 0)
            {
               this.str2 += "<br>";
            }
            else if(_loc4_ != param2.length - 1)
            {
               this.str2 += "：";
            }
            _loc4_++;
         }
         this.str2 += "</font>";
         _loc4_ = 0;
         while(_loc4_ < param3.length)
         {
            this.str3 += "[" + param3[_loc4_] + "]";
            if((_loc4_ + 1) % 4 == 0)
            {
               this.str3 += "<br>";
            }
            else if(_loc4_ != param3.length - 1)
            {
               this.str3 += "：";
            }
            _loc4_++;
         }
         this.str3 += "</font>";
      }
      
      public function removeMc() : void
      {
         if(this.gongMc1 != null && this.gongMc1.parent != null)
         {
            this.gongMc1.stop();
            this.gongMc1.parent.removeChild(this.gongMc1);
         }
         if(this.gongMc2 != null && this.gongMc2.parent != null)
         {
            this.gongMc2.stop();
            this.gongMc2.parent.removeChild(this.gongMc2);
         }
         if(this.gongMc3 != null && this.gongMc3.parent != null)
         {
            this.gongMc3.stop();
            this.gongMc3.parent.removeChild(this.gongMc3);
         }
         if(this.gongMc4 != null && this.gongMc4.parent != null)
         {
            this.gongMc4.stop();
            this.gongMc4.parent.removeChild(this.gongMc4);
         }
         if(this.gongMc5 != null && this.gongMc5.parent != null)
         {
            this.gongMc5.stop();
            this.gongMc5.parent.removeChild(this.gongMc5);
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
            yanhuaMc.x = 210 - yanhuaMc.width / 2;
            yanhuaMc.y = 280 - yanhuaMc.height / 2;
            addChild(yanhuaMc);
         },null,false,GameConfig.fileBaseFolder + "res/data/mc/wabao.swf");
      }
      
      public function setDantianBuff(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Bitmap = null;
         while(this.buffSpr.numChildren > 0)
         {
            this.buffSpr.removeChildAt(0);
         }
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.buffSpr.addChild(_loc3_);
            _loc3_.x = -(_loc4_ * 40) - 2;
            _loc3_.y = -2;
            _loc2_ = new ItemFace(param1[_loc4_]);
            _loc2_.x = -(_loc4_ * 40);
            this.buffSpr.addChild(_loc2_);
            _loc4_++;
         }
      }
      
      public function setJihuo(param1:Boolean = false) : void
      {
         if(param1 == false)
         {
            this.jihuoFt.visible = false;
            this.jihuoBtn.visible = true;
         }
         else
         {
            this.jihuoFt.visible = true;
            this.jihuoBtn.visible = false;
         }
      }
      
      public function setJihuoDantianJinjieBtn(param1:int) : void
      {
         if(param1 == 1)
         {
            this.jihuoDantianJinjieBtn.enabled = true;
         }
         else if(param1 == 2)
         {
            this.jihuoDantianJinjieBtn.enabled = false;
         }
         else
         {
            this.jihuoDantianJinjieBtn.visible = false;
            this.dantianJinjieFt.visible = true;
         }
      }
      
      public function setDengjiTupoBtn(param1:String, param2:Boolean, param3:Boolean) : void
      {
         this.boo = param2;
         this.djtpBtn.enabled = param3;
         this.djtpBtn.label = param1;
      }
      
      public function setDantianJinjieBuff(param1:Skill) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Bitmap = null;
         while(this.buffSpr2.numChildren > 0)
         {
            this.buffSpr2.removeChildAt(0);
         }
         if(param1 == null)
         {
            this.djtpBtn.label = LanResManager.getLanCommonTextWords("等级突破");
            this.dantianJinjieFt.visible = false;
            this.jihuoDantianJinjieBtn.visible = true;
            return;
         }
         _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.buffSpr2.addChild(_loc3_);
         _loc3_.x = 0;
         _loc3_.y = 0;
         _loc2_ = new ItemFace(param1);
         _loc2_.showKungFuTag();
         _loc2_.setShowCount(false);
         _loc2_.x = 2;
         _loc2_.y = 2;
         this.buffSpr2.addChild(_loc2_);
      }
      
      public function setDantianEnabledFun() : void
      {
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.djtpBtn.enabled = false;
         this.jihuoBtn.enabled = false;
         this.jihuoDantianJinjieBtn.enabled = false;
         this.isMainchar = false;
         this.check.enabled = false;
         this.ynEquip.mouseChildren = false;
         this.ynEquip.mouseEnabled = false;
      }
      
      public function setDantianJinjieEnabledFun(param1:Boolean) : void
      {
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
      
      public function setXinFaItem(param1:int) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Bitmap = null;
         while(this.xinFaSpr.numChildren > 0)
         {
            this.xinFaSpr.removeChildAt(0);
         }
         _loc3_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.xinFaSpr.addChild(_loc3_);
         _loc3_.x = -2;
         _loc3_.y = -2;
         if(param1 == 0 || param1 == 1)
         {
            _loc2_ = new ItemFace(new Goods(SpecialGoodsID.QIYUNDANTIANXINFA));
         }
         else
         {
            _loc2_ = new ItemFace(new Goods(SpecialGoodsID.DIWANGDANTIANXINFA));
         }
         _loc2_.x = 0;
         if(param1 == 0)
         {
            _loc2_.filters = Tools.blackWhiteFilter;
         }
         this.xinFaSpr.addChild(_loc2_);
      }
      
      public function setDantianMenghuanJindan(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_JINDAN_ID] + LanResManager.getLanCommonTextWords("个梦幻金丹") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_JINDAN_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_JINDAN_ID] * 1;
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.DANTIAN_JINGLINGZHAOHUANSHI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.DANTIAN_JINGLINGZHAOHUANSHI_ID])
            {
               this.setSkillJiHuo(42313);
               this.kuang.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.kuang.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.DANTIAN_YANXIAOYUNSAN_ID];
         }
         else
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_JINDAN_ID] + LanResManager.getLanCommonTextWords("个梦幻金丹") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_JINDAN_ID] * 10000 + "," + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_JINDAN_ID] * 1;
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.DANTIAN_JINGLINGZHAOHUANSHI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.DANTIAN_JINGLINGZHAOHUANSHI_ID])
            {
               this.setSkillJiHuo(42313);
               this.kuang.visible = true;
               this.check.visible = true;
               this.checkLabel.visible = true;
            }
            else
            {
               this.kuang.visible = false;
               this.check.visible = false;
               this.checkLabel.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.DANTIAN_YANXIAOYUNSAN_ID];
         }
      }
      
      public function setJiHuo() : void
      {
         if(this.isMainchar)
         {
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.DANTIANJUEXING];
         }
         else
         {
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.DANTIANJUEXING];
         }
      }
      
      public function setSkillJiHuo(param1:int) : void
      {
         if(this.gooditem)
         {
            if(this.gooditem.parent)
            {
               this.gooditem.parent.removeChild(this.gooditem);
            }
         }
         var _loc2_:Goods = new Goods(param1);
         this.gooditem = new ItemFace(_loc2_);
         this.gooditem.x = 175 + 2;
         this.gooditem.y = 100 + 15 + 2;
         addChild(this.gooditem);
      }
      
      public function jingling(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function showYN_TJLY(param1:Boolean) : void
      {
         this.ynchk.enabled = param1;
         this.ft_yntjly.visible = this.ynchk.visible;
      }
      
      public function showYN_SDXN(param1:Boolean) : void
      {
         this.ynchk_sdxn.enabled = param1;
         this.ynchk_sdxn.visible = param1;
         this.ft_ynsdxn.visible = this.ynchk_sdxn.visible;
      }
      
      public function setCHK_SDXN(param1:Boolean) : void
      {
         this.ynchk_sdxn.selectState = param1;
         if(param1)
         {
            this.ynchk.selectState = false;
         }
      }
      
      public function setCHK_TJLY(param1:Boolean) : void
      {
         this.ynchk.selectState = param1;
         if(param1)
         {
            this.ynchk_sdxn.selectState = false;
         }
      }
      
      public function setYN(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.ynItemSpr.numChildren > 0)
         {
            this.ynItemSpr.removeChildAt(0);
         }
         if(!this.isMainchar)
         {
            this.ynEquip.mouseEnabled = false;
         }
         else
         {
            this.ynEquip.mouseEnabled = true;
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSITION_TAIJILIANGYI)
            {
               _loc4_.x = 90;
               _loc4_.y = 2;
               this.ynItemSpr.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

