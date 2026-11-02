package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
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
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
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
   
   public class Anqi extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta4:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fta6:FTextArea;
      
      private var fta7:FTextArea;
      
      private var tsnlfta:FTextArea;
      
      private var xljdfta1:FTextArea;
      
      private var xljdfta2:FTextArea;
      
      private var check1:FCheckBox;
      
      private var lb:FLabel;
      
      private var tf:TextFormat;
      
      private var CyaqcjBtn:SecondButton;
      
      private var TssdBtn:SmallButton;
      
      public var TppjBtn:SmallButton;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var xldjBar:ColorBar;
      
      private var imgIco:DisplayObject;
      
      private var imgIcoFilters:int;
      
      private var weixiulianPd:Boolean;
      
      private var imgIcoStr:String;
      
      private var skillContent:Sprite;
      
      private var skillImg:Bitmap;
      
      private var item:ItemFace;
      
      public var img:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var gongMc:MovieClip;
      
      private var gongMcSpr:Sprite;
      
      private var mcObj:Object = {};
      
      private var loadUrl:String;
      
      private var kfSkillContent:Sprite;
      
      private var kfBtn:SmallButton;
      
      private var kfSkill:ItemFace;
      
      private var skillSprite:Sprite;
      
      public var imgBt:Bitmap;
      
      private var bTangMenMiJi:Boolean;
      
      private var tangMenMiJi:ItemFace;
      
      private var tangMenMiJiContainer:Sprite;
      
      private var equipContainer:Sprite;
      
      private var isLockOn:Boolean = false;
      
      private var zhongJiAnQi:Boolean;
      
      private var fts1:FTextArea;
      
      private var wushuangshi:int = 0;
      
      private var tianjue:Boolean = false;
      
      private var fts2:FTextArea;
      
      private var feidao:int = 0;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var hdKuang:Bitmap;
      
      public function Anqi()
      {
         super();
         this.initChar();
      }
      
      private function initChar() : void
      {
         var bg:Bitmap = null;
         this.img = new Bitmap();
         this.img.name = "ui.anqi.ui";
         addChild(this.img);
         this.gongMcSpr = new Sprite();
         this.gongMcSpr.x = 16;
         this.gongMcSpr.y = 186;
         addChild(this.gongMcSpr);
         bg = StaticValue.getBitmapByClassName("ui.anqi.kuang");
         bg.x = 13;
         bg.y = 180;
         addChild(bg);
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
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            width = 180;
            height = 147;
            x = 11;
            y = 10;
            textColor = StaticValue.BlUE20;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"在您获得暗器后",[StaticValue.GREEN_HTML,StaticValue.RED_HTML],false) + "</textformat>";
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 110;
            height = 90;
            x = 197;
            y = 12;
            textColor = StaticValue.ORANGE;
            htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanTextWords(this,"当前所使用暗器",null,false) + "</textformat>";
         }
         addChild(this.fta);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 88;
            height = 90;
            x = 307;
            y = 11;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta1);
         this.xljdfta1 = new FTextArea();
         with(this.xljdfta1)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 88;
            height = 90;
            x = 307;
            y = 36;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.xljdfta1);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 240 - 35;
         this.check1.y = 106;
         this.check1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.lb = new FLabel();
         with(this.lb)
         {
            x = 265 - 35;
            y = 108;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"开启暗器使用");
         }
         addChild(this.lb);
         this.CyaqcjBtn = new SecondButton();
         this.CyaqcjBtn.label = LanResManager.getLanTextWords(this,"查阅暗器成就");
         addChild(this.CyaqcjBtn);
         this.CyaqcjBtn.x = 240;
         this.CyaqcjBtn.y = 132;
         this.CyaqcjBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.CyaqcjBtn.visible = false;
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "previousButton";
         addChild(this.previousButton);
         this.previousButton.x = 239 - 35;
         this.previousButton.y = 135;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta3 = new FTextArea();
         with(this.fta3)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 34;
            height = 16;
            x = 260 - 35;
            y = 135;
            textColor = StaticValue.WHITE;
            background = true;
            backgroundColor = 1186072;
            htmlText = "";
         }
         addChild(this.fta3);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "nextButton";
         addChild(this.nextButton);
         this.nextButton.x = 297 - 35;
         this.nextButton.y = 135;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tangMenMiJiContainer = new Sprite();
         this.tangMenMiJiContainer.x = 345 - 35;
         this.tangMenMiJiContainer.y = 120;
         addChild(this.tangMenMiJiContainer);
         this.tangMenMiJi = new ItemFace(new Goods(9748));
         this.tangMenMiJi.x = 0;
         this.tangMenMiJi.y = 0;
         this.tangMenMiJi.filters = Tools.blackWhiteFilter;
         this.tangMenMiJi.mouseChildren = false;
         this.tangMenMiJi.mouseEnabled = false;
         this.tangMenMiJiContainer.addChild(this.tangMenMiJi);
         ToolTips.createToolTips(this.tangMenMiJiContainer,this,function(param1:*, param2:MouseEvent):String
         {
            var _loc3_:String = "";
            _loc3_ += "<textformat leading=\'6\'>";
            var _loc4_:String = LanResManager.getLanCommonTextWords("唐门秘籍：攻击 14888 防御 10888 血量 68888 暴击 88 闪避 88");
            var _loc5_:String = LanResManager.getLanCommonTextWords("当玩家PK或者是打怪时触发“看我暗器”") + "<br/>" + LanResManager.getLanCommonTextWords("将获得双倍攻击伤害（命中一次等于命中两次，100%触发）") + "<br/>" + LanResManager.getLanCommonTextWords("将会使暗器伤害输出以基础伤害的五倍命中对方");
            _loc3_ += "<font color=\'" + (bTangMenMiJi ? StaticValue.YELLOW_HTML : StaticValue.HUISE_HTML) + "\'>" + _loc4_ + "</font><br>";
            _loc3_ += "<font color=\'" + (bTangMenMiJi ? StaticValue.GREEN_HTML : StaticValue.HUISE_HTML) + "\'>" + _loc5_ + "</font><br>";
            _loc3_ += "</textformat>";
            if(tianjue)
            {
               _loc3_ += "<textformat leading=\'6\'>";
               _loc3_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("唐门天绝秘技(已激活)") + "<br>" + LanResManager.getLanCommonTextWords("提升属性：攻击：36888亿、防御32888亿、血量40888亿、所有武功提升 320000层") + "<br>" + LanResManager.getLanCommonTextWords("天绝秘技（特殊技能）：拥有唐门秘籍的所有效果，并100%抵抗暗器所有的技能效果！");
               _loc3_ += "</textformat>";
            }
            return _loc3_;
         });
         this.hdKuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.hdKuang);
         this.hdKuang.x = 214 + 40 * 3;
         this.hdKuang.y = 322;
         this.equipContainer = new Sprite();
         this.equipContainer.x = 360;
         this.equipContainer.y = 120;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,100,40);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainer);
         this.fta7 = new FTextArea();
         with(this.fta7)
         {
            filters = StaticValue.filter;
            x = 15;
            y = 322;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,"隐藏属性：");
         }
         addChild(this.fta7);
         this.fta7.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip3);
         this.fta7.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip3);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 65;
            height = 185;
            x = 145;
            y = 172;
            textColor = StaticValue.BLUE;
            htmlText = "<textformat leading=\'6.5\'>" + LanResManager.getLanTextWords(this,"暗器名称",null,false) + "</textformat>";
         }
         addChild(this.fta);
         this.skillContent = new Sprite();
         this.skillContent.x = 214;
         this.skillContent.y = 322;
         addChild(this.skillContent);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 190;
            height = 185;
            x = 213;
            y = 170;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta2);
         this.tsnlfta = new FTextArea();
         with(this.tsnlfta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 178;
            height = 35;
            x = 213;
            y = 320;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.tsnlfta);
         this.xljdfta2 = new FTextArea();
         with(this.xljdfta2)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 190;
            height = 185;
            x = 213;
            y = 193;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.xljdfta2);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 60;
            height = 16;
            x = 280;
            y = 172;
            textColor = StaticValue.BLUE;
            htmlText = LanResManager.getLanTextWords(this,"暗器品阶");
         }
         addChild(this.fta);
         this.fta4 = new FTextArea();
         with(this.fta4)
         {
            multiline = true;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            width = 50;
            height = 17;
            x = 342;
            y = 170;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta4);
         this.fta = new FTextArea();
         with(this.fta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 60;
            height = 16;
            x = 260;
            y = 292;
            textColor = StaticValue.BLUE;
            htmlText = LanResManager.getLanTextWords(this,"攻击目标数量暗器");
         }
         addChild(this.fta);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            multiline = true;
            filters = StaticValue.filter;
            width = 50;
            height = 17;
            x = 342;
            y = 292;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.fta5);
         this.TssdBtn = new SmallButton();
         this.TssdBtn.label = LanResManager.getLanCommonTextWords("提升速度");
         addChild(this.TssdBtn);
         this.TssdBtn.x = 341;
         this.TssdBtn.y = 194;
         this.TssdBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.TppjBtn = new SmallButton();
         this.TppjBtn.label = LanResManager.getLanCommonTextWords("突破瓶颈");
         addChild(this.TppjBtn);
         this.TppjBtn.x = 341;
         this.TppjBtn.y = 218;
         this.TppjBtn.enabled = false;
         this.TppjBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.kfSkillContent = new Sprite();
         this.kfSkillContent.x = 335;
         this.kfSkillContent.y = 319;
         addChild(this.kfSkillContent);
         this.skillSprite = new Sprite();
         this.skillSprite.y = 3;
         this.kfBtn = new SmallButton();
         this.kfBtn.label = LanResManager.getLanCommonTextWords("暗器开封");
         this.kfBtn.y = 15;
         this.kfBtn.x = 3;
         this.kfBtn.visible = false;
         this.fts1 = new FTextArea();
         this.fts1.x = 17 + 16;
         this.fts1.y = 165;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("暗器无双风云决");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：20888亿、防御18888亿、血量22888亿、所有武功提升 350000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：已使用") + wushuangshi + LanResManager.getLanCommonTextWords("颗暗器无双石，每颗增加人物攻击20亿，以及暗器修炼进度10点！！");
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 17 + 16;
         this.fts2.y = 165 + 30;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("小李飞刀秘诀");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("小李飞刀（特殊技能）：小李飞刀，传闻为大侠李寻欢所用暗器，是兵器谱排行第一的暗器，飞刀") + "<br>" + LanResManager.getLanCommonTextWords("一出，鬼哭神嚎，所到之处，血流成河。攻击时必定令对手命中飞刀乱舞状态，刀刀入身，持续10") + "<br>" + LanResManager.getLanCommonTextWords("秒。使对手每秒掉血50%，且视线模糊，无法进行任何攻击操作，该技能为最强暗器神技，无法被") + "<br>" + LanResManager.getLanCommonTextWords("抵抗，冷却60秒！") + "<br>" + LanResManager.getLanCommonTextWords("开启小李飞刀养成功能：使用后可增加人物攻击20亿，以及暗器修炼进度100点。") + "<br>" + LanResManager.getLanCommonTextWords("当前已使用小李飞刀") + feidao + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + feidao * 20 + LanResManager.getLanCommonTextWords("亿，暗器修炼进度") + feidao * 100 + LanResManager.getLanCommonTextWords("点");
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 255 + 40 - 280 - 5 - 15;
         this.fts3.y = 7 + 20 + 105 + 34 + 20 + 25 - 70;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 140;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("九天鲲鹏（神禽）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 500000层") + "<br>" + LanResManager.getLanCommonTextWords("鲲鹏：鲲鹏翱翔九天，寻琼浆为饮、逐神龙而食。神话传说中飞行速度最快的神禽，一翅伸开一百") + "<br>" + LanResManager.getLanCommonTextWords("八十万里、双翅齐展三百六十万里，鲲鹏善于变化、通灵万物。人物可自己骑乘。") + "<br>" + LanResManager.getLanCommonTextWords("九天鲲鹏：攻击时100%触发九天鲲鹏，持续10秒；在此状态下，自身每秒将施发一次鲲鹏展翅只要") + "<br>" + LanResManager.getLanCommonTextWords("靠近5格范围内的所有对手将受到影响瞬间被击飞；且被击飞的对手将无力抵抗瞬间眩晕原地5秒，") + "<br>" + LanResManager.getLanCommonTextWords("每受到一次冲击对手的生命值将瞬间下降至10%，且无法恢复，冷却60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 256 + 117 - 280 + 15 + 40;
         this.checkZq.y = 7 + 20 + 105 + 34 + 20 + 25 - 70;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,87]));
         }
      }
      
      private function onMouseTip3(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.fta7.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip("<textformat leading=\'\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("在襄阳城金钱帮长老处可以激活凤凰翎的隐藏属性") + "</font></textformat>");
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.fta7.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip3);
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
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQI_PREVIOUS_CLICK));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQI_NEXT_CLICK));
               break;
            case this.CyaqcjBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQI_CHAYUEANQICHENGJIU_CLICK));
               break;
            case this.TssdBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQI_TISHENGSUDU_CLICK));
               break;
            case this.TppjBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQI_TUPOPINGJING_CLICK));
               break;
            case this.kfBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQI_KAIFENG_CLICK));
         }
         switch(param1.currentTarget)
         {
            case this.check1:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQI_SHIFOUSHIYONGANQI_CLICK,"",this.check1.selectState ? true : false));
         }
      }
      
      private function cleanSkill() : void
      {
         while(this.skillContent.numChildren > 0)
         {
            this.skillContent.removeChildAt(0);
         }
      }
      
      public function setDangqianInitialize(param1:Boolean, param2:Array) : void
      {
         this.zhongJiAnQi = param2[5];
         if(this.weixiulianPd)
         {
            this.fta1.htmlText = "<textformat leading=\'8\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param2[0] + "</font><br>" + "<br>" + param2[2] + LanResManager.getLanTextWords(this,"级") + "<br>" + (this.zhongJiAnQi ? 100 : param2[3]) + "%" + "</textformat>";
            this.xljdfta1.htmlText = param2[1];
         }
         else
         {
            this.fta1.htmlText = LanResManager.getLanTextWords(this,"暂未获得暗器");
            this.xljdfta1.htmlText = "";
         }
         this.bTangMenMiJi = param2[4];
         if(this.bTangMenMiJi)
         {
            this.tangMenMiJi.filters = [];
         }
         else
         {
            this.tangMenMiJi.filters = Tools.blackWhiteFilter;
         }
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.ANQI_WUSHUANGFENGYUN_ID];
            this.wushuangshi = GameState.dictMainStatus[SpecialGoodsID.ANQI_WUSHUANGSHI_ID];
            this.tianjue = GameState.dictMainStatus[SpecialGoodsID.ANQI_TIANJUEMIJI_ID];
            if(this.tianjue)
            {
               this.tangMenMiJi.filters = [];
            }
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.ANQI_XIAOLIFEIDAOMIJUE_ID];
            this.feidao = GameState.dictMainStatus[SpecialGoodsID.ANQI_XIAOLIFEIDAO_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.ANQI_JIUTIANKUNPENG_ID];
            this.checkZq.visible = GameState.dictMainStatus[SpecialGoodsID.ANQI_JIUTIANKUNPENG_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.ANQI_WUSHUANGFENGYUN_ID];
            this.wushuangshi = GameState.dictTargetStatus[SpecialGoodsID.ANQI_WUSHUANGSHI_ID];
            this.tianjue = GameState.dictTargetStatus[SpecialGoodsID.ANQI_TIANJUEMIJI_ID];
            if(this.tianjue)
            {
               this.tangMenMiJi.filters = [];
            }
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.ANQI_XIAOLIFEIDAOMIJUE_ID];
            this.feidao = GameState.dictTargetStatus[SpecialGoodsID.ANQI_XIAOLIFEIDAO_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.ANQI_JIUTIANKUNPENG_ID];
            this.checkZq.visible = GameState.dictTargetStatus[SpecialGoodsID.ANQI_JIUTIANKUNPENG_ID];
         }
      }
      
      public function setAnqiInitialize(param1:Array) : void
      {
         var value:Array = param1;
         if(this.weixiulianPd)
         {
            this.fta2.htmlText = "<textformat leading=\'7.5\'>" + value[0] + "<br>" + "<br>" + "<br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + value[5] + "</font><br>" + "<textformat leading=\'5\'>" + value[6] + "<br>" + value[7] + LanResManager.getLanTextWords(this,"格") + "<br>" + (this.zhongJiAnQi ? 100 : value[8]) + "%" + "</textformat>" + "</textformat>";
            this.xljdfta2.htmlText = value[1] + "/" + value[2];
            this.fta4.htmlText = value[10] + LanResManager.getLanTextWords(this,"阶");
            this.fta5.htmlText = value[11];
            this.tsnlfta.htmlText = "<textformat leading=\'0\'>" + value[9] + "</textformat>";
            if(value[9] == "")
            {
               this.cleanSkill();
            }
            if(value[1] < value[2])
            {
               this.TssdBtn.enabled = true;
               this.TssdBtn.label = LanResManager.getLanCommonTextWords("提升速度");
            }
            else if(value[1] == value[2])
            {
               this.TssdBtn.enabled = false;
               this.TssdBtn.label = LanResManager.getLanCommonTextWords("提升速度");
            }
            if(this.xldjBar != null)
            {
               removeChild(this.xldjBar);
            }
            if(value[3] < value[4])
            {
               this.TppjBtn.enabled = false;
               this.TppjBtn.label = LanResManager.getLanCommonTextWords("突破瓶颈");
               this.xldjBar = new ColorBar(1,93,12);
               addChild(this.xldjBar);
               this.xldjBar.x = 223;
               this.xldjBar.y = 221;
               this.xldjBar.setValue(value[3],value[4]);
            }
            else if(value[3] == value[4])
            {
               if(value[1] == value[2])
               {
                  this.TppjBtn.enabled = true;
                  this.TppjBtn.label = LanResManager.getLanCommonTextWords("突破瓶颈");
                  this.xldjBar = new ColorBar(1,93,12,false);
                  addChild(this.xldjBar);
                  this.xldjBar.x = 223;
                  this.xldjBar.y = 221;
                  this.xldjBar.setValue(value[3],value[4]);
               }
               else
               {
                  this.TppjBtn.enabled = false;
                  this.TppjBtn.label = LanResManager.getLanCommonTextWords("突破瓶颈");
                  this.xldjBar = new ColorBar(1,93,12);
                  addChild(this.xldjBar);
                  this.xldjBar.x = 223;
                  this.xldjBar.y = 221;
                  this.xldjBar.setValue(value[3],value[4]);
               }
            }
            else if(value[3] > value[4])
            {
               this.TppjBtn.enabled = false;
               this.TppjBtn.label = LanResManager.getLanCommonTextWords("突破瓶颈");
               this.xldjBar = new ColorBar(5,93,12,false);
               addChild(this.xldjBar);
               this.xldjBar.x = 223;
               this.xldjBar.y = 221;
               this.xldjBar.setValue(value[4],value[4]);
            }
            this.tf = new TextFormat();
            this.tf.align = "center";
            if(this.fta6 != null && Boolean(this.fta6.parent))
            {
               this.fta6.parent.removeChild(this.fta6);
            }
            this.fta6 = new FTextArea();
            with(this.fta6)
            {
               
               multiline = true;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               width = 93;
               height = 20;
               x = 223;
               y = 218;
               textColor = StaticValue.WHITE;
               htmlText = "";
            }
            addChild(this.fta6);
            if(value[3] < value[4])
            {
               this.fta6.htmlText = "";
            }
            else if(value[3] == value[4])
            {
               if(value[1] == value[2])
               {
                  this.fta6.htmlText = LanResManager.getLanCommonTextWords("已达瓶颈");
               }
               else
               {
                  this.fta6.htmlText = "";
               }
            }
            else if(value[3] > value[4])
            {
               this.fta6.htmlText = LanResManager.getLanCommonTextWords("已达成");
            }
            this.imgIcoFilters = 1;
            if(value[12] == false)
            {
               this.TssdBtn.enabled = false;
               this.TssdBtn.label = LanResManager.getLanCommonTextWords("未修炼");
               this.TppjBtn.enabled = false;
               this.TppjBtn.label = LanResManager.getLanCommonTextWords("未修炼");
               this.imgIcoFilters = 0;
            }
         }
         else
         {
            this.fta2.htmlText = LanResManager.getLanTextWords(this,"完成【襄阳金钱帮长老】任务获得",[StaticValue.GREEN_HTML]);
            this.xljdfta2.htmlText = "";
            this.fta4.htmlText = "";
            this.fta5.htmlText = "";
            this.tsnlfta.htmlText = "";
            if(this.fta6 != null && Boolean(this.fta6.parent))
            {
               removeChild(this.fta6);
            }
            this.TssdBtn.enabled = false;
            this.TssdBtn.label = LanResManager.getLanCommonTextWords("未修炼");
            this.TppjBtn.enabled = false;
            this.TppjBtn.label = LanResManager.getLanCommonTextWords("未修炼");
         }
      }
      
      public function setPageInitialize(param1:int, param2:int, param3:String) : void
      {
         var a1:int = param1;
         var a2:int = param2;
         var str:String = param3;
         this.fta3.htmlText = a1 + "/" + a2;
         if(this.weixiulianPd)
         {
            if(a1 == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(a1 == a2)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
            this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/anqi/" + a1 + ".swf";
            if(Boolean(this.gongMc) && this.gongMc.parent != null)
            {
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            while(this.gongMcSpr.numChildren > 0)
            {
               this.gongMcSpr.removeChildAt(0);
            }
            if(this.mcObj[a1] != null)
            {
               this.gongMc = this.mcObj[a1];
               this.gongMc.play();
               this.gongMc.x = 0;
               this.gongMc.y = 0;
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
                  mcObj[a1] = gongMc;
                  if(gongMc)
                  {
                     gongMc.x = 0;
                     gongMc.y = 0;
                     gongMcSpr.addChild(gongMc);
                  }
               },null,false,this.loadUrl);
            }
         }
         else
         {
            this.previousButton.enabled = false;
            this.nextButton.enabled = false;
            this.loadUrl = GameConfig.fileBaseFolder + "res/data/mc/anqi/" + a1 + ".swf";
            if(Boolean(this.gongMc) && this.gongMc.parent != null)
            {
               this.gongMc.stop();
               this.gongMc.parent.removeChild(this.gongMc);
            }
            while(this.gongMcSpr.numChildren > 0)
            {
               this.gongMcSpr.removeChildAt(0);
            }
            if(this.mcObj[a1] != null)
            {
               this.gongMc = this.mcObj[a1];
               this.gongMc.play();
               this.gongMc.x = 0;
               this.gongMc.y = 0;
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
                  mcObj[a1] = gongMc;
                  if(gongMc)
                  {
                     gongMc.x = 0;
                     gongMc.y = 0;
                     gongMcSpr.addChild(gongMc);
                  }
               },null,false,this.loadUrl);
            }
         }
      }
      
      public function setAnqiUse(param1:Boolean) : void
      {
         this.check1.selectState = param1;
      }
      
      public function setAnqiXljdTop(param1:String) : void
      {
         this.xljdfta1.htmlText = param1;
      }
      
      public function setAnqiXljdBottom(param1:String) : void
      {
         this.xljdfta2.htmlText = param1;
      }
      
      public function setAnqiBtnFun(param1:int) : void
      {
         if(param1 == 1)
         {
            this.check1.enabled = true;
            this.TssdBtn.enabled = true;
            this.TppjBtn.enabled = true;
            this.CyaqcjBtn.enabled = true;
            this.imgIcoFilters = 1;
            this.weixiulianPd = true;
         }
         else
         {
            this.check1.enabled = false;
            this.TssdBtn.enabled = false;
            this.TppjBtn.enabled = false;
            this.CyaqcjBtn.enabled = false;
            this.imgIcoFilters = 0;
            this.weixiulianPd = false;
         }
      }
      
      public function setBierenBunInitialize(param1:int, param2:int, param3:String) : void
      {
         this.fta3.htmlText = param1 + "/" + param2;
         if(this.imgIcoStr != param3)
         {
            if(this.imgIco != null)
            {
               removeChild(this.imgIco);
            }
            this.imgIco = FLoader.startLoad(param3,120,120);
            this.imgIco.x = 16;
            this.imgIco.y = 186;
            addChildAt(this.imgIco,1);
            this.imgIcoStr = param3;
         }
         if(this.imgIcoFilters == 1)
         {
            this.imgIco.filters = [];
         }
         else if(this.imgIcoFilters == 0)
         {
            this.imgIco.filters = Tools.blackWhiteFilter;
         }
      }
      
      public function setBierenAnqiBunFun() : void
      {
         this.check1.enabled = false;
         this.TssdBtn.enabled = false;
         this.TppjBtn.enabled = false;
         this.CyaqcjBtn.enabled = false;
         this.previousButton.enabled = false;
         this.nextButton.enabled = false;
         this.kfBtn.enabled = false;
         this.isLockOn = true;
      }
      
      public function setSkillTeshunengli(param1:Array) : void
      {
         this.cleanSkill();
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.skillImg = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.skillContent.addChild(this.skillImg);
            this.skillImg.x = 40 * _loc2_;
            this.item = new ItemFace(param1[_loc2_]);
            this.item.x = 40 * _loc2_ + 2;
            this.item.setShowCount(false);
            this.item.y = 2;
            this.skillContent.addChild(this.item);
            _loc2_++;
         }
      }
      
      public function setYincangshuxing(param1:Boolean, param2:Boolean, param3:int) : void
      {
         if(param1)
         {
            if(param2)
            {
               this.fta7.textColor = StaticValue.ORANGE;
               this.fta7.htmlText = LanResManager.getLanTextWords(this,"隐藏属性已激活",[param3]);
            }
            else
            {
               this.fta7.textColor = StaticValue.SKY_BLUE;
               this.fta7.htmlText = LanResManager.getLanTextWords(this,"隐藏属性未激活",[param3]);
            }
         }
         else
         {
            this.fta7.textColor = StaticValue.GREEN_STRONG;
            this.fta7.htmlText = LanResManager.getLanTextWords(this,"隐藏属性无");
         }
      }
      
      public function removeMc() : void
      {
         if(Boolean(this.gongMc) && this.gongMc.parent != null)
         {
            this.gongMc.stop();
            this.gongMc.parent.removeChild(this.gongMc);
         }
      }
      
      public function setSkill(param1:Skill) : void
      {
         this.imgBt = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.skillSprite.addChild(this.imgBt);
         if(param1 != null)
         {
            param1.isLearn = 1;
            this.kfSkill = new ItemFace(param1);
            this.kfSkill.setShowCount(false);
            this.kfSkill.x = this.imgBt.x + 2;
            this.kfSkill.y = this.imgBt.y + 2;
            this.skillSprite.addChild(this.kfSkill);
         }
      }
      
      public function SetkfSkillContentFalse(param1:Boolean) : void
      {
         if(param1)
         {
            this.kfSkillContent.visible = true;
         }
         else
         {
            this.kfSkillContent.visible = false;
         }
      }
      
      public function SetkfSkillContent(param1:Boolean) : void
      {
         if(param1)
         {
            this.skillSprite.visible = true;
            this.kfBtn.visible = false;
         }
         else
         {
            this.skillSprite.visible = false;
            this.kfBtn.visible = true;
         }
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(!this.isLockOn)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function anqiZuoQi(param1:Boolean) : void
      {
         this.checkZq.selectState = param1;
      }
      
      public function setAnQiZhuangBei(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_ANQI_DUOMINGCHIZHEN)
            {
               this.equipContainer.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_20171115KONGQUEYUPEI)
            {
               _loc4_.x = 214 + 40 * 3 + 2 - 360;
               _loc4_.y = 322 + 2 - 120;
               this.equipContainer.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

