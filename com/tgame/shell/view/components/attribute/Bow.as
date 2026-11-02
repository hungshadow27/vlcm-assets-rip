package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
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
   
   public class Bow extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var ftaa:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      public var bgImg:Bitmap;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var count:FTextArea;
      
      private var tf:TextFormat;
      
      public var jjhcBtn:SecondButton;
      
      private var shuxingFt:FTextArea;
      
      private var shuxingScroll:FVScorllBar;
      
      private var shuxingListContainer:Sprite;
      
      private var lailiFt:FTextArea;
      
      private var lailiScroll:FVScorllBar;
      
      private var lailiListContainer:Sprite;
      
      private var jianshuContainer:Sprite;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var jianzhiContainer:Sprite;
      
      private var kuang:Bitmap;
      
      private var check1:FCheckBox;
      
      private var jianzhiArr:Array;
      
      private var shuxingSpr:Sprite;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var gongImg:DisplayObject;
      
      private var icoImg:DisplayObject;
      
      private var gongMcId:int;
      
      private var loadUrl:String;
      
      private var buffSpr:Sprite;
      
      private var check:FCheckBox;
      
      private var lb:FLabel;
      
      private var jihuoFt:FTextArea;
      
      private var btnYC:SecondButton;
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var tootips1:String = "";
      
      private var mcObj:Object;
      
      private var jianzhiyouObj:Object;
      
      private var jianzhiwuObj:Object;
      
      private var equipContainer1:Sprite;
      
      private var equipContainer2:Sprite;
      
      private var isOthers:Boolean = false;
      
      private var YNequip:Sprite;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var lianzhu:Boolean = false;
      
      private var youdao:Boolean = false;
      
      private var chuanci:Boolean = false;
      
      private var yinfeng:Boolean = false;
      
      private var liehuo:Boolean = false;
      
      private var chenshui:Boolean = false;
      
      private var fts3:FTextArea;
      
      public var check2:FCheckBox;
      
      private var checkLabel1:FLabel;
      
      public function Bow()
      {
         var bg:DisplayObject;
         var img:Bitmap;
         this.mcObj = {};
         this.jianzhiyouObj = {};
         this.jianzhiwuObj = {};
         super();
         this.bgImg = new Bitmap();
         this.bgImg.name = "ui.char.archery.ui";
         bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/bow/ui.bow.bg.swf");
         bg.x = 0;
         bg.y = 0;
         addChild(bg);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 22;
         this.gongMcSpr.y = 12;
         addChild(this.gongMcSpr);
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
         this.kuang = StaticValue.getBitmapByClassName("ui.char.archery.slot");
         addChild(this.kuang);
         this.kuang.x = 21;
         this.kuang.y = 7;
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 19;
         this.previousButton.y = 280;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 180;
            textColor = StaticValue.ORANGE;
            text = LanResManager.getLanCommonTextWords("箭壶中的箭支");
         }
         addChild(this.fta1);
         this.fta1.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.fta1.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 55 + 2 - 2;
         this.check.y = 155;
         this.check.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 70 + 2;
            y = 155 + 2;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("外观显示");
         }
         addChild(this.lb);
         this.count = new FTextArea();
         with(this.count)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 34;
            height = 16;
            x = 40;
            y = 280;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            text = "1/7";
         }
         addChild(this.count);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 77;
         this.nextButton.y = 280;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.jjhcBtn = new SecondButton();
         this.jjhcBtn.label = LanResManager.getLanCommonTextWords("进阶合成");
         addChild(this.jjhcBtn);
         this.jjhcBtn.x = 100;
         this.jjhcBtn.y = 277;
         this.jjhcBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.shuxingListContainer = new Sprite();
         addChild(this.shuxingListContainer);
         with(this.shuxingListContainer)
         {
            x = 185;
            y = 25;
         }
         this.fta = new FTextArea();
         with(this.fta)
         {
            wordWrap = true;
            x = 0;
            y = 0;
            width = 180;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            text = LanResManager.getLanTextWords(this,"弓箭名称");
         }
         this.shuxingListContainer.addChild(this.fta);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            wordWrap = true;
            x = 30;
            y = 0;
            width = 180;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            text = "";
         }
         this.shuxingListContainer.addChild(this.fta3);
         this.ftaa = new FTextArea();
         with(this.ftaa)
         {
            wordWrap = true;
            x = 0;
            y = fta.y + fta.height;
            width = 180;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            text = LanResManager.getLanTextWords(this,"弓箭阶数");
         }
         this.shuxingListContainer.addChild(this.ftaa);
         this.fta4 = new FTextArea();
         with(this.fta4)
         {
            wordWrap = true;
            x = 30;
            y = fta.y + fta.height;
            width = 180;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            text = "";
         }
         this.shuxingListContainer.addChild(this.fta4);
         this.fta = new FTextArea();
         with(this.fta)
         {
            wordWrap = true;
            x = 0;
            y = ftaa.y + ftaa.height;
            width = 180;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            text = LanResManager.getLanCommonTextWords("携带后增加人物属性");
         }
         this.shuxingListContainer.addChild(this.fta);
         this.shuxingFt = new FTextArea();
         with(this.shuxingFt)
         {
            wordWrap = true;
            x = 18;
            y = fta.y + fta.height - 2;
            width = 180;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         this.shuxingListContainer.addChild(this.shuxingFt);
         this.shuxingSpr = new Sprite();
         this.shuxingSpr.x = 0;
         this.shuxingSpr.y = 140;
         this.shuxingListContainer.addChild(this.shuxingSpr);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 226;
         this.check1.y = 284;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            x = 245;
            y = 285;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("开启弓箭使用");
         }
         addChild(this.fta);
         this.buffSpr = new Sprite();
         this.buffSpr.x = 349;
         this.buffSpr.y = 245;
         addChild(this.buffSpr);
         this.fta = new FTextArea();
         with(this.fta)
         {
            wordWrap = true;
            x = 0;
            y = 2;
            width = 180;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = LanResManager.getLanCommonTextWords("弓箭来历");
         }
         this.shuxingSpr.addChild(this.fta);
         this.lailiFt = new FTextArea();
         with(this.lailiFt)
         {
            wordWrap = true;
            x = 0;
            y = 20;
            width = 180;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         this.shuxingSpr.addChild(this.lailiFt);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         img.x = 10;
         img.y = 191 + 4;
         this.equipContainer1 = new Sprite();
         this.equipContainer1.x = 12;
         this.equipContainer1.y = 193 + 4;
         with(this.equipContainer1.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainer1.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick2,false,30);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         img.x = 10;
         img.y = 191 + 40 + 4;
         this.equipContainer2 = new Sprite();
         this.equipContainer2.x = 12;
         this.equipContainer2.y = 193 + 40 + 4;
         with(this.equipContainer2.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainer2.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick2,false,30);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 330;
         img.y = 85;
         this.YNequip = new Sprite();
         this.YNequip.x = 332;
         this.YNequip.y = 87;
         with(this.YNequip.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.YNequip.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick2,false,30);
         addChild(this.YNequip);
         this.jianzhiContainer = new Sprite();
         addChild(this.jianzhiContainer);
         this.jianzhiContainer.x = 122;
         this.jianzhiContainer.y = 193;
         this.jianzhiContainer.graphics.beginFill(0,0.5);
         this.jianzhiContainer.graphics.drawRect(0,0,39,78);
         this.jianzhiContainer.graphics.endFill();
         this.jianzhiContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.jianzhiContainer.addEventListener(MouseEvent.CLICK,this.onJianzhiClick,false,30);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 5;
            y = 305;
            textColor = StaticValue.ORANGE;
            text = LanResManager.getLanCommonTextWords("箭术能力");
         }
         addChild(this.fta2);
         this.jianshuContainer = new Sprite();
         addChild(this.jianshuContainer);
         with(this.jianshuContainer)
         {
            x = 32 + 7;
            y = 324;
         }
         this.btnYC = new SecondButton();
         this.btnYC.x = 310;
         this.btnYC.y = 15 + 3 - 1;
         this.btnYC.label = LanResManager.getLanCommonTextWords("激活隐藏属性");
         this.btnYC.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnYC);
         this.jihuoFt = new FTextArea();
         this.jihuoFt.x = 265;
         this.jihuoFt.y = 5;
         this.jihuoFt.autoSize = TextFieldAutoSize.LEFT;
         this.jihuoFt.htmlText = "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("隐藏属性已激活") + "</font>";
         this.jihuoFt.visible = false;
         addChild(this.jihuoFt);
         this.fta8 = new FTextArea();
         with(this.fta8)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 277 + 5 - 30;
            y = 46;
            textColor = StaticValue.RED;
            htmlText = LanResManager.getLanCommonTextWords("顶级激活进度：");
         }
         addChild(this.fta8);
         this.fta8.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.fta8.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         this.fta9 = new FTextArea();
         with(this.fta9)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 381 - 20 + 5;
            y = 46;
            textColor = StaticValue.RED;
            htmlText = "";
         }
         addChild(this.fta9);
         this.fts1 = new FTextArea();
         this.fts1.x = 5;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 60;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("当提升100次后，可以激活梦幻弓箭终极神技“锁神弓”：攻击时有几率触发，命中对手后使对手在30秒内无法使用弓箭技能。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 5;
         this.fts2.y = 7 + 20 + 15;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("弓箭狂化升级秘籍（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("双击使用后改变自身弓箭外观为紫禁天穹弓，同时自身所有弓箭技能都将狂化") + "<br></font>";
            _loc1_ += "</textformat>";
            if(lianzhu)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("狂化连珠秘籍: 攻击8次必定触发对前方连珠箭攻击范围内造成30%血量伤害。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(youdao)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("狂化诱导秘籍：攻击9次必定无视对手跳闪造成30%血量伤害。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(chuanci)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("狂化穿刺秘籍：攻击时100%无视对手防御，有几率无视对手无敌状态。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(yinfeng)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("狂化阴风秘籍：攻击18次必定造成对手混乱8秒。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(liehuo)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("狂化烈火秘籍：攻击36次必定造成5格范围内掉血30%。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            if(chenshui)
            {
               _loc1_ += "<textformat leading=\'6\'>";
               _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("狂化沉睡秘籍：攻击48次必定让对手沉睡30秒。") + "<br></font>";
               _loc1_ += "</textformat>";
            }
            return _loc1_;
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 80;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 170;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("轩辕弓（神器）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords(" 特殊属性：攻击128888亿防御108888亿血量138888亿暴击 88888闪避 88888所有武功2500000层") + "<br>" + LanResManager.getLanCommonTextWords("轩辕弓：轩辕弓乃轩辕皇帝遗传世间的上古神器，人物也可自己切换轩辕弓。") + "<br>" + LanResManager.getLanCommonTextWords("轩辕箭神：攻击时100%触发轩辕箭神，持续10秒；自身在此状态下，将拉起轩辕弓只要锁定对手，") + "<br>" + LanResManager.getLanCommonTextWords("不管对手在哪都可命中，每次攻击都可瞬间穿刺对手心脏而过，使对手麻痹原地瞬间流失血量60%,") + "<br>" + LanResManager.getLanCommonTextWords("持续5秒；自身在箭神的状态下，所有技能将无法命中，直到箭神消失为止。冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 10;
         this.check2.y = 80 + 20;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel1 = new FLabel();
         with(this.checkLabel1)
         {
            x = check2.x + 20;
            --check2.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel1);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,36]));
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.jianzhiContainer.mouseY < 39)
         {
            _loc2_ = 1;
         }
         else
         {
            _loc2_ = 2;
         }
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOW_OPTION_PANEL_DRAG_ENTER,"",_loc2_));
      }
      
      private function onJianzhiClick(param1:MouseEvent) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.target is ItemFace)
         {
            _loc2_ = Goods((param1.target as ItemFace).getBaseItem());
            _loc3_ = 0;
            while(_loc3_ < this.jianzhiArr.length)
            {
               if(this.jianzhiArr[_loc3_][0] == _loc2_)
               {
                  _loc4_ = int(this.jianzhiArr[_loc3_][1]);
                  this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOW_OPTION_PANEL_STONE_CLICK,"",_loc4_));
                  return;
               }
               _loc3_++;
            }
         }
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
               this.fta1.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc2_ = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"在您获得弓箭后") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"当您的箭壶中没有箭支时") + "<br></font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanTextWords(this,"当箭壶中放入某种箭支后") + "<br></font>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanTextWords(this,"并且当该箭术被触发时将不会消耗您任何内力") + "<br></font>" + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,"箭支的放入") + "</font>" + "</textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.fta1.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
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
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOW_SHANGYIYE_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOW_XIAYIYE_CLICK));
               break;
            case this.jjhcBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOW_JINJIEHECHENG_CLICK));
               break;
            case this.btnYC:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_GONGJIANYINCANGSHUXING_JIHUO_CLICK));
         }
         switch(param1.currentTarget)
         {
            case this.check1:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOW_SHIFOUSHIYONGANQI_CLICK,"",this.check1.selectState));
               break;
            case this.check:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_BOW_SHIFOUXIANSHI_CLICK,"",this.check.selectState));
         }
      }
      
      public function setJianshu(param1:Array, param2:int, param3:int) : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:int = 0;
         while(this.jianshuContainer.numChildren > 0)
         {
            this.jianshuContainer.removeChildAt(0);
         }
         while(_loc5_ < param1.length)
         {
            _loc4_ = new ItemFace(param1[_loc5_]);
            _loc4_.showKungFuTag();
            _loc4_.setShowCount(false);
            if(_loc5_ > 2)
            {
               _loc4_.x = _loc5_ * 55 + 1 - _loc5_ * 4 - 7;
            }
            else
            {
               _loc4_.x = _loc5_ * 55 - _loc5_ * 4 - 7;
            }
            _loc4_.y -= 2;
            this.jianshuContainer.addChild(_loc4_);
            _loc5_++;
         }
         this.fta2.text = LanResManager.getLanTextWords(this,0,[param2,param3]);
      }
      
      public function setJianzhi(param1:Array, param2:int) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:int = 0;
         this.jianzhiArr = param1;
         while(this.jianzhiContainer.numChildren > 0)
         {
            this.jianzhiContainer.removeChildAt(0);
         }
         while(_loc4_ < param1.length)
         {
            _loc3_ = new ItemFace(param1[_loc4_][0]);
            _loc3_.y = (param1[_loc4_][1] - 1) * 40;
            this.jianzhiContainer.addChild(_loc3_);
            _loc4_++;
         }
         if(this.jianzhiArr != null && this.jianzhiArr.length > 0)
         {
            if(this.gongImg != null && this.gongImg.parent != null)
            {
               removeChild(this.gongImg);
            }
            if(this.jianzhiyouObj[param2] != null)
            {
               this.gongImg = this.jianzhiyouObj[param2];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jianhu/youjian" + param2 + ".png",78,96);
               this.jianzhiyouObj[param2] = this.gongImg;
            }
            this.gongImg.x = 30 + 15;
            this.gongImg.y = 190;
            addChildAt(this.gongImg,1);
            addChild(this.gongImg);
         }
         else
         {
            if(this.gongImg != null && this.gongImg.parent != null)
            {
               removeChild(this.gongImg);
            }
            if(this.jianzhiwuObj[param2] != null)
            {
               this.gongImg = this.jianzhiwuObj[param2];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jianhu/wujian" + param2 + ".png",78,96);
               this.jianzhiwuObj[param2] = this.gongImg;
            }
            this.gongImg.x = 30 + 15;
            this.gongImg.y = 185;
            addChildAt(this.gongImg,1);
            addChild(this.gongImg);
         }
      }
      
      public function setBowPage(param1:int, param2:int, param3:Boolean = true, param4:int = 0) : void
      {
         var int1:int = param1;
         var int2:int = param2;
         var bo1:Boolean = param3;
         var int3:int = param4;
         if(int1 < 1)
         {
            int1 = 1;
         }
         if(int2 > 8)
         {
            int2 = 1;
         }
         this.count.text = int1 + "/" + int2;
         if(int1 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(int1 == int2)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
         while(this.gongMcSpr.numChildren > 0)
         {
            this.gongMcSpr.removeChildAt(0);
         }
         this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/gongjian/gongjian" + int1 + ".swf";
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
         if(this.jianzhiArr != null && this.jianzhiArr.length > 0)
         {
            if(this.gongImg != null && this.gongImg.parent != null)
            {
               removeChild(this.gongImg);
            }
            if(this.jianzhiyouObj[int1] != null)
            {
               this.gongImg = this.jianzhiyouObj[int1];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jianhu/youjian" + int1 + ".png",78,96);
               this.jianzhiyouObj[int1] = this.gongImg;
            }
            this.gongImg.x = 30 + 15;
            this.gongImg.y = 190;
            addChildAt(this.gongImg,1);
         }
         else
         {
            if(this.gongImg != null && this.gongImg.parent != null)
            {
               removeChild(this.gongImg);
            }
            if(this.jianzhiwuObj[int1] != null)
            {
               this.gongImg = this.jianzhiwuObj[int1];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/jianhu/wujian" + int1 + ".png",78,96);
               this.jianzhiwuObj[int1] = this.gongImg;
            }
            this.gongImg.x = 30 + 15;
            this.gongImg.y = 185;
            addChildAt(this.gongImg,1);
         }
         if(bo1)
         {
            this.jjhcBtn.enabled = true;
         }
         else
         {
            this.jjhcBtn.enabled = false;
         }
         if(this.icoImg != null && this.icoImg.parent != null)
         {
            removeChild(this.icoImg);
         }
         if(int3 == 1)
         {
            this.icoImg = StaticValue.getBitmapByClassName("ui.char.archery.text.1");
            addChild(this.icoImg);
            this.icoImg.x = 30;
            this.icoImg.y = 30;
         }
         else if(int3 == 2)
         {
            this.icoImg = StaticValue.getBitmapByClassName("ui.char.archery.text.2");
            addChild(this.icoImg);
            this.icoImg.x = 30;
            this.icoImg.y = 30;
         }
      }
      
      public function setZuoyong(param1:String) : void
      {
         this.lailiFt.htmlText = "<textformat leading=\'1\'>" + param1 + "</textformat>";
         this.shuxingSpr.y = this.shuxingFt.y + this.shuxingFt.height;
      }
      
      public function setShuxing(param1:Array, param2:Boolean) : void
      {
         var _loc3_:String = "";
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if(_loc4_ != param1.length - 1)
            {
               if(param2 && _loc4_ == 5)
               {
                  _loc3_ += param1[_loc4_] + "<font color=\'" + StaticValue.GREEN_HTML + "\'>    +2%</font>" + "<br>";
               }
               else
               {
                  _loc3_ += param1[_loc4_] + "<br>";
               }
            }
            else if(param2 && _loc4_ == 6)
            {
               _loc3_ += param1[_loc4_] + "<font color=\'" + StaticValue.GREEN_HTML + "\'>  +2%</font>";
            }
            else
            {
               _loc3_ += param1[_loc4_];
            }
            _loc4_++;
         }
         this.shuxingFt.htmlText = "<textformat leading=\'1\'>" + _loc3_ + "</textformat>";
         this.shuxingSpr.y = this.shuxingFt.y + this.shuxingFt.height;
      }
      
      public function setName(param1:String, param2:String) : void
      {
         this.fta3.text = param1;
         this.fta4.text = param2 + LanResManager.getLanCommonTextWords("阶");
      }
      
      public function setIsOpen(param1:Boolean) : void
      {
         this.check1.selectState = param1;
      }
      
      public function setShow(param1:Boolean) : void
      {
         this.check.selectState = param1;
      }
      
      public function setBowEnabledFun() : void
      {
         this.isOthers = true;
         this.check1.enabled = false;
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.jjhcBtn.enabled = false;
         this.check.enabled = false;
         this.btnYC.enabled = false;
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
      
      public function setBuff(param1:Array) : void
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
      
      public function setButtonYC(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.jihuoFt.visible = false;
            this.btnYC.visible = true;
         }
         else
         {
            this.jihuoFt.visible = true;
            this.btnYC.visible = false;
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
      
      public function setBowEquip(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainer1.numChildren > 0)
         {
            this.equipContainer1.removeChildAt(0);
         }
         while(this.equipContainer2.numChildren > 0)
         {
            this.equipContainer2.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_BOW_ZHUANGBEI1)
            {
               this.equipContainer1.addChild(_loc4_);
            }
            if(_loc3_.res.position == ItemPositionRange.POSTION_BOW_ZHUANGBEI2)
            {
               this.equipContainer2.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      private function onItemClick2(param1:MouseEvent) : void
      {
         if(!this.isOthers)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function setBowMenghuanYujian(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_JIANYU_ID] + LanResManager.getLanCommonTextWords("个梦幻箭羽") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_JIANYU_ID] * 10000 + ",<br>" + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictMainStatus[SpecialGoodsID.MENGHUAN_JIANYU_ID] * 1;
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.BOW_KUANGHUA];
            this.lianzhu = GameState.dictMainStatus[SpecialGoodsID.BOW_KUANGHUA_LIANZHUJIAN];
            this.youdao = GameState.dictMainStatus[SpecialGoodsID.BOW_KUANGHUA_YOUDAOJIAN];
            this.chuanci = GameState.dictMainStatus[SpecialGoodsID.BOW_KUANGHUA_CHUANCIJIAN];
            this.yinfeng = GameState.dictMainStatus[SpecialGoodsID.BOW_KUANGHUA_YINFENGJIAN];
            this.liehuo = GameState.dictMainStatus[SpecialGoodsID.BOW_KUANGHUA_LIEHUOJIAN];
            this.chenshui = GameState.dictMainStatus[SpecialGoodsID.BOW_KUANGHUA_CHENSHUIJIAN];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.GONGJIAN_XUANYUANGONG_ID];
            this.check2.visible = GameState.dictMainStatus[SpecialGoodsID.GONGJIAN_XUANYUANGONG_ID];
            this.checkLabel1.visible = GameState.dictMainStatus[SpecialGoodsID.GONGJIAN_XUANYUANGONG_ID];
         }
         else
         {
            this.fts1.htmlText = LanResManager.getLanCommonTextWords("已吃") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_JIANYU_ID] + LanResManager.getLanCommonTextWords("个梦幻箭羽") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_JIANYU_ID] * 10000 + ",<br>" + LanResManager.getLanCommonTextWords("武功层数:") + GameState.dictTargetStatus[SpecialGoodsID.MENGHUAN_JIANYU_ID] * 1;
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.BOW_KUANGHUA];
            this.lianzhu = GameState.dictTargetStatus[SpecialGoodsID.BOW_KUANGHUA_LIANZHUJIAN];
            this.youdao = GameState.dictTargetStatus[SpecialGoodsID.BOW_KUANGHUA_YOUDAOJIAN];
            this.chuanci = GameState.dictTargetStatus[SpecialGoodsID.BOW_KUANGHUA_CHUANCIJIAN];
            this.yinfeng = GameState.dictTargetStatus[SpecialGoodsID.BOW_KUANGHUA_YINFENGJIAN];
            this.liehuo = GameState.dictTargetStatus[SpecialGoodsID.BOW_KUANGHUA_LIEHUOJIAN];
            this.chenshui = GameState.dictTargetStatus[SpecialGoodsID.BOW_KUANGHUA_CHENSHUIJIAN];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.GONGJIAN_XUANYUANGONG_ID];
            this.check2.visible = GameState.dictTargetStatus[SpecialGoodsID.GONGJIAN_XUANYUANGONG_ID];
            this.checkLabel1.visible = GameState.dictTargetStatus[SpecialGoodsID.GONGJIAN_XUANYUANGONG_ID];
         }
      }
      
      public function setBowDanTian(param1:Boolean) : void
      {
         this.check2.selectState = param1;
      }
      
      public function setYNBowEquip(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.YNequip.numChildren > 0)
         {
            this.YNequip.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSITION_LIANZHOUNU)
            {
               this.YNequip.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

