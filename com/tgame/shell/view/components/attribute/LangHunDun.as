package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.langhundun.model.info.LangHunDunVO;
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
   import gs.TweenMax;
   
   public class LangHunDun extends Sprite
   {
      
      public static const UI_LANGHUNDUN_GUANBI_CLICK:String = "UI_LANGHUNDUN_GUANBI_CLICK";
      
      private var bg:DisplayObject;
      
      private var bg1:DisplayObject;
      
      private var bgan:DisplayObject;
      
      private var cengshu:FTextArea;
      
      private var tishengBtn:SecondButton;
      
      private var zidongBtn:SecondButton;
      
      private var shuxing:FTextArea;
      
      private var miaoshu:FTextArea;
      
      private var _$parent:DisplayObject;
      
      public const LANGHUNDUN_MAX:int = 400;
      
      private var nowId:int = 0;
      
      private var lookingId:int;
      
      private var tupoBo:Boolean = false;
      
      private var bloodMc:MovieClip;
      
      private var mcObj:Array;
      
      private var bloodMcSpr:Sprite;
      
      private var kuang:Bitmap;
      
      private var jinengSpr:Sprite;
      
      private var tf:TextFormat;
      
      private var zhufuzhi:int;
      
      private var img:Bitmap;
      
      private var CjBar:ColorBar;
      
      private var xingyunzhiNum:int;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var act:Number = 0;
      
      private var def:Number = 0;
      
      private var shengming:Number = 0;
      
      private var baoji:Number = 0;
      
      private var shanbi:Number = 0;
      
      private var StarSpr:Sprite;
      
      private var star1:DisplayObject;
      
      private var star2:DisplayObject;
      
      private var star3:DisplayObject;
      
      private var Sint1:int;
      
      private var Sint2:int;
      
      private var Sint3:int;
      
      private var jiachengSpr:Sprite;
      
      private var fireBarMC:MovieClip = null;
      
      private var fireBarMC1:MovieClip = null;
      
      private var fts1:FTextArea;
      
      private var fts2:FTextArea;
      
      private var langhunshi:int = 0;
      
      private var fts3:FTextArea;
      
      public var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var fts4:FTextArea;
      
      private var check1:FCheckBox;
      
      private var checkLabel1:FLabel;
      
      private var fts5:FTextArea;
      
      private var check2:FCheckBox;
      
      private var checkLabel2:FLabel;
      
      private var fts6:FTextArea;
      
      public function LangHunDun()
      {
         var fjjn:FTextArea;
         var box:FCanvas = null;
         var title:FTextArea = null;
         super();
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tipCanvas.addChild(this.tip);
         box = new FCanvas();
         box.skin = "box";
         addChild(box);
         box.x = 0;
         box.y = 0;
         box.width = 403;
         box.height = 366;
         box = new FCanvas();
         box.skin = "box";
         box.x = 2;
         box.y = 231 + 32 - 25;
         box.width = 400;
         box.height = 135 - 32 + 25;
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/bg.swf");
         this.bg1.x = 0;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.bloodMcSpr = new Sprite();
         this.bloodMcSpr.x = 2 + 6 - 1 - 2;
         this.bloodMcSpr.y = 2 - 10 + 14;
         addChild(this.bloodMcSpr);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/kulou.swf");
         this.bg.x = 58;
         this.bg.y = 109;
         addChild(this.bg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/kulou.swf");
         this.bg.x = 58 + 254;
         this.bg.y = 109;
         addChild(this.bg);
         this.jiachengSpr = new Sprite();
         this.jiachengSpr.visible = true;
         addChild(this.jiachengSpr);
         this.jiachengSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onCheckTip);
         this.jiachengSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onCheckTip);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/mingzi.swf");
         this.bg1.x = 18;
         this.bg1.y = 16;
         this.jiachengSpr.addChild(this.bg1);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/jiahao.swf");
         this.bg1.x = 18 + 90 - 37;
         this.bg1.y = 16 + 1;
         this.jiachengSpr.addChild(this.bg1);
         this.tishengBtn = new SecondButton();
         addChild(this.tishengBtn);
         this.tishengBtn.x = 240 + 50 - 100 - 105;
         this.tishengBtn.y = 205 + 25 - 20 + 25 - 10;
         this.tishengBtn.label = LanResManager.getLanCommonTextWords("开始召唤");
         this.tishengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.zidongBtn = new SecondButton();
         addChild(this.zidongBtn);
         this.zidongBtn.x = 240 + 50 - 40;
         this.zidongBtn.y = 205 + 25 - 20 + 25 - 10;
         this.zidongBtn.label = LanResManager.getLanCommonTextWords("自动召唤");
         this.zidongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         title = new FTextArea();
         title.multiline = true;
         title.filters = StaticValue.filter;
         title.width = 100;
         title.height = 110;
         title.x = 24 + 50;
         title.y = 250 + 12 - 15 + 23;
         title.textColor = StaticValue.ORANGE;
         this.miaoshu = new FTextArea();
         addChild(this.miaoshu);
         this.miaoshu.multiline = true;
         this.miaoshu.wordWrap = true;
         this.miaoshu.width = 110 + 20;
         this.miaoshu.x = 23 - 11 + 60 - 7 - 2 - 2;
         this.miaoshu.y = 250 + 20 - 3 + 20 - 5;
         this.miaoshu.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("当玩家受到【天下无狗】的负面状态时，将有50%的几率触发狼魂盾的力量，从而触发更强的效果") + "</font>";
         this.shuxing = new FTextArea();
         this.shuxing.multiline = true;
         this.shuxing.wordWrap = true;
         this.shuxing.filters = StaticValue.filter;
         this.shuxing.width = 170 + 40;
         this.shuxing.height = 110;
         this.shuxing.x = 210 + 13 + 17 - 20 - 20 - 3 - 3;
         this.shuxing.y = 250 + 20 - 3 + 20 - 5;
         this.shuxing.textColor = StaticValue.ORANGE;
         addChild(this.shuxing);
         this.shuxing.htmlText = "<font size = \'12\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("通过【超级元素精华】可以召唤狼魂盾，召唤的时候有几率点燃灵活火，灵火点燃后每次召唤将获得十倍的灵值，当灵值存储满时将直接进阶，灵火每次点燃持续一天，每天6点将熄灭灵火。") + "</font>";
         fjjn = new FTextArea();
         fjjn.multiline = true;
         fjjn.filters = StaticValue.filter;
         fjjn.width = 100;
         fjjn.height = 110;
         fjjn.x = 205 + 112 - 9 + 36 - 335;
         fjjn.y = 255 + 5 + 5 + 6 + 22 - 12 + 10;
         fjjn.textColor = StaticValue.ORANGE;
         fjjn.htmlText = "<textformat leading=\'50\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("附加技能") + "</font></textformat>";
         addChild(fjjn);
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = -2 + 33 - 17;
         this.kuang.y = 300 - 2 + 20;
         this.jinengSpr = new Sprite();
         this.jinengSpr.x = 33 - 17;
         this.jinengSpr.y = 300 + 20;
         addChild(this.jinengSpr);
         this.mcObj = new Array();
         this.CjBar = new ColorBar(5,348,9);
         addChild(this.CjBar);
         this.CjBar.x = 69 - 36 - 2;
         this.CjBar.y = 152 - 11 + 121;
         this.CjBar.setValue(2,2);
         this.StarSpr = new Sprite();
         this.StarSpr.x = 46;
         this.StarSpr.y = 7;
         this.StarSpr.visible = true;
         addChild(this.StarSpr);
         this.fts1 = new FTextArea();
         this.fts1.x = 245;
         this.fts1.y = 15;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 200;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("狼魂盾顶级激活（已激活）");
         this.fts1.visible = false;
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击：4888亿、防御3888亿、血量8888亿、所有武功提升80000层") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts2 = new FTextArea();
         this.fts2.x = 245;
         this.fts2.y = 15 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 200;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("狼魂内功心法（已激活）");
         this.fts2.visible = false;
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("提升属性：攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("特殊属性：激活该秘籍后，每次可使用狼魂石进行养成属性，每次可增加攻击200亿，所有武功提升10000层！（最多可养成5000次！）") + "<br>" + LanResManager.getLanCommonTextWords("已养成") + langhunshi + LanResManager.getLanCommonTextWords("次") + "<br>" + LanResManager.getLanCommonTextWords("增加攻击") + langhunshi * 200 + LanResManager.getLanCommonTextWords("亿  提升武功") + langhunshi * 10000 + LanResManager.getLanCommonTextWords("层");
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10;
         this.fts3.y = 10 + 20 + 10;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.autoSize = TextFieldAutoSize.LEFT;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("狼魂特技秘籍（已激活）");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("增加人物攻击：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("可随意使用狼魂特技使人物变成狼人终极形态") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 50 + 10;
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
         this.fts4 = new FTextArea();
         this.fts4.x = 10;
         this.fts4.y = 80;
         this.fts4.textColor = StaticValue.GREEN;
         this.fts4.width = 170;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("月圆召唤石");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层 ") + "<br>" + LanResManager.getLanCommonTextWords("狼魂盾：当激活月圆召唤的玩家，可随便召唤狼魂盾飘浮在人物左右且可产生祝福BUFF。") + "<br>" + LanResManager.getLanCommonTextWords("狼魂狂暴：攻击时有几率触发狼魂狂暴，持续10秒；在此状态下，狼魂盾可吸收月圆之") + "<br>" + LanResManager.getLanCommonTextWords("力使人物的攻击在提升一档次，攻击对手时，每命中一次都将瞬间震击对手至十丈之外，") + "<br>" + LanResManager.getLanCommonTextWords("且每被震击一次的对手都将瞬间") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 10;
         this.check1.y = 80 + 20;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel1 = new FLabel();
         with(this.checkLabel1)
         {
            x = check1.x + 20;
            --check1.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel1);
         this.fts5 = new FTextArea();
         this.fts5.x = 10;
         this.fts5.y = 80 + 50;
         this.fts5.textColor = StaticValue.GREEN;
         this.fts5.width = 170;
         this.fts5.height = 20;
         this.fts5.htmlText = LanResManager.getLanCommonTextWords("天照");
         this.fts5.visible = false;
         addChild(this.fts5);
         ToolTips.createToolTips(this.fts5,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击 68888亿、防御60888亿、血量80888亿、所有武功提升 880000层") + "<br>" + LanResManager.getLanCommonTextWords("天照邪兽：天照，上古阴间的恶魔，自开天以为，该邪兽从未出现在世间，") + "<br>" + LanResManager.getLanCommonTextWords("也没有人出过他的真容。激活天照的玩家，可自己转生成天照。") + "<br>" + LanResManager.getLanCommonTextWords("天照噬魂：攻击时有几率触发天照噬魂，持续10秒；在此状态下，每次攻") + "<br>" + LanResManager.getLanCommonTextWords("击对手，对手都将受到天照噬魂的影响，无法触发分身，无法触发无敌，") + "<br>" + LanResManager.getLanCommonTextWords("无法使用任何武功；当状态解除后，天照将施放阴气，范围5格内的所有") + "<br>" + LanResManager.getLanCommonTextWords("玩家将陷入阴暗沉睡，持续60秒。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 10;
         this.check2.y = 80 + 20 + 50;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.checkLabel2 = new FLabel();
         with(this.checkLabel2)
         {
            x = check2.x + 20;
            --check2.y;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("自动换装");
         }
         addChild(this.checkLabel2);
         this.fts6 = new FTextArea();
         this.fts6.x = 10;
         this.fts6.y = 80 + 50 + 40;
         this.fts6.textColor = StaticValue.GREEN;
         this.fts6.width = 170;
         this.fts6.height = 20;
         this.fts6.htmlText = LanResManager.getLanCommonTextWords("狼血秘籍(已激活)");
         this.fts6.visible = false;
         addChild(this.fts6);
         ToolTips.createToolTips(this.fts6,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("狼血秘籍：拥有天照的玩家，可激活狼血秘籍；攻击时100%触发狼人附体，") + "<br>" + LanResManager.getLanCommonTextWords("持续30秒；在此状态下，每经过10秒都将立即清除自身所有负面状态后无") + "<br>" + LanResManager.getLanCommonTextWords("敌3秒；在狼人附体状态下，每次攻击都可将吸收对手的10%血量为自身补") + "<br>" + LanResManager.getLanCommonTextWords("充。冷却90秒") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check.selectState,5]));
               break;
            case this.check1:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check1.selectState,22]));
               break;
            case this.check2:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.check2.selectState,47]));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.tishengBtn:
               this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LANGHUNDUN_KAISHITISHENG_CLICK));
               break;
            case this.zidongBtn:
               if(this.zidongBtn.label == LanResManager.getLanCommonTextWords("自动召唤"))
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LANGHUNDUN_ZIDONGTISHENG_CLICK,"",true));
               }
               else
               {
                  this._$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_LANGHUNDUN_ZIDONGTISHENG_CLICK,"",false));
               }
         }
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this._$parent = param1;
      }
      
      public function setinitilizeUI(param1:Boolean, param2:LangHunDunVO) : void
      {
         this.setBg(param2.nowID);
         this.setShuxingJiacheng(param2.act,param2.hp,param2.shanbi,param2.def,param2.baoji);
         this.setZhaoShiMsg(param2.nowID);
         this.setSkill(param2.skillid);
         this.showFireBar(param2.ishuoyan);
         this.setJiHuo(param1);
         this.check.selectState = param2.chuanyi;
         this.check1.selectState = param2.isDantian;
         this.check2.selectState = param2.isTianZhao;
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_DINGJI_ID];
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_NEIGONGXINFA_ID];
            this.langhunshi = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_LANGHUNSHI_ID];
            this.fts3.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_TEJI_ID];
            this.check.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_TEJI_ID];
            this.checkLabel.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_TEJI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_YUANYUEZHAOHUANSHI_ID])
            {
               this.fts4.visible = true;
               this.check1.visible = true;
               this.checkLabel1.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.check1.visible = false;
               this.checkLabel1.visible = false;
            }
            this.fts5.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_TIANZHAO_ID];
            this.check2.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_TIANZHAO_ID];
            this.checkLabel2.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_TIANZHAO_ID];
            this.fts6.visible = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_LANGXUEMIJI_ID];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_DINGJI_ID];
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_NEIGONGXINFA_ID];
            this.langhunshi = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_LANGHUNSHI_ID];
            this.fts3.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_TEJI_ID];
            this.check.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_TEJI_ID];
            this.checkLabel.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_TEJI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_YUANYUEZHAOHUANSHI_ID])
            {
               this.fts4.visible = true;
               this.check1.visible = true;
               this.checkLabel1.visible = true;
            }
            else
            {
               this.fts4.visible = false;
               this.check1.visible = false;
               this.checkLabel1.visible = false;
            }
            this.fts5.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_TIANZHAO_ID];
            this.check2.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_TIANZHAO_ID];
            this.checkLabel2.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_TIANZHAO_ID];
            this.fts6.visible = GameState.dictTargetStatus[SpecialGoodsID.LANGHUNDUN_LANGXUEMIJI_ID];
         }
      }
      
      private function setBg(param1:int) : void
      {
         var mcId:int = 0;
         var loadUrl:String = null;
         var id:int = param1;
         if(id <= 30)
         {
            mcId = 1;
         }
         else if(id > 30 && id <= 60)
         {
            mcId = 2;
         }
         else if(id > 60 && id <= 99)
         {
            mcId = 3;
         }
         else if(id >= 100)
         {
            mcId = 4;
         }
         loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/bg" + mcId + ".swf";
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         if(this.mcObj[mcId] != null)
         {
            this.bloodMc = this.mcObj[mcId];
            this.bloodMc.play();
            this.bloodMcSpr.addChild(this.bloodMc);
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
               if(Boolean(bloodMc) && bloodMc.parent != null)
               {
                  bloodMc.stop();
                  bloodMc.parent.removeChild(bloodMc);
               }
               while(bloodMcSpr.numChildren > 0)
               {
                  bloodMcSpr.removeChildAt(0);
               }
               bloodMc = _loc2_.content as MovieClip;
               mcObj[mcId] = bloodMc;
               if(bloodMc)
               {
                  bloodMcSpr.addChild(bloodMc);
               }
            },null,false,loadUrl);
         }
      }
      
      public function setShuxingJiacheng(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : void
      {
         this.act = param1;
         this.def = param4;
         this.shengming = param2;
         this.baoji = param5;
         this.shanbi = param3;
      }
      
      public function setZhaoShiMsg(param1:int = -1) : void
      {
         this.nowId = param1;
         if(param1 == this.LANGHUNDUN_MAX)
         {
            this.tishengBtn.enabled = false;
            this.zidongBtn.enabled = false;
         }
         else
         {
            this.tishengBtn.enabled = true;
            this.zidongBtn.enabled = true;
         }
         if(param1 == 100)
         {
            this.tishengBtn.enabled = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_KONGLANGZHIXIN_ID];
            this.zidongBtn.enabled = GameState.dictMainStatus[SpecialGoodsID.LANGHUNDUN_KONGLANGZHIXIN_ID];
         }
         if(param1 < 10)
         {
            this.Sint1 = param1;
            this.Sint2 = 0;
            this.Sint3 = 0;
         }
         else if(param1 < 100)
         {
            this.Sint1 = param1 % 10;
            this.Sint2 = param1 / 10;
            this.Sint3 = 0;
         }
         else
         {
            this.Sint1 = param1 % 100 % 10;
            this.Sint2 = param1 % 100 / 10;
            this.Sint3 = param1 / 100;
         }
         while(this.StarSpr.numChildren > 0)
         {
            this.StarSpr.removeChildAt(0);
         }
         this.star1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/" + this.Sint1 + ".swf");
         this.star1.visible = true;
         this.star1.x = 10 + 20 + 20 + 36;
         this.star1.y = 10;
         this.StarSpr.addChild(this.star1);
         this.star2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/" + this.Sint2 + ".swf");
         this.star2.visible = true;
         this.star2.x = 10 + 20 + 36;
         this.star2.y = 10;
         this.StarSpr.addChild(this.star2);
         this.star3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/" + this.Sint3 + ".swf");
         this.star3.visible = true;
         this.star3.x = 10 + 36;
         this.star3.y = 10;
         this.StarSpr.addChild(this.star3);
      }
      
      public function setSkill(param1:int) : void
      {
         var _loc3_:ItemFace = null;
         while(this.jinengSpr.numChildren > 0)
         {
            this.jinengSpr.removeChildAt(0);
         }
         var _loc2_:Skill = new Skill(param1);
         _loc2_.isLearn = 1;
         _loc3_ = new ItemFace(_loc2_);
         _loc3_.showKungFuTag();
         _loc3_.setShowCount(false);
         this.jinengSpr.addChild(_loc3_);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.zhufuzhi = param1;
         if(param1 > param2)
         {
            this.CjBar.setValue(param2,param2);
         }
         else
         {
            this.CjBar.setValue(param1,param2);
         }
         if(param3 != 0)
         {
            this.xingyunzhiNum = param3;
            this.aa();
         }
      }
      
      public function setTuPoBtn(param1:Boolean) : void
      {
         if(param1)
         {
            this.zidongBtn.label = LanResManager.getLanCommonTextWords("自动召唤");
         }
         else
         {
            this.zidongBtn.label = LanResManager.getLanCommonTextWords("停止召唤");
         }
      }
      
      public function setEnableFun() : void
      {
         this.tishengBtn.enabled = false;
         this.zidongBtn.enabled = false;
      }
      
      private function aa(param1:Event = null) : void
      {
         var e:Event = param1;
         var ftaw:FTextArea = new FTextArea();
         with(ftaw)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.CENTER;
            x = 69;
            y = 152;
            textColor = StaticValue.YELLOW;
            width = 132;
            htmlText = LanResManager.getLanCommonTextWords("灵值+") + String(xingyunzhiNum);
         }
         addChild(ftaw);
         TweenMax.to(ftaw,1,{
            "y":100,
            "onComplete":this.onCom,
            "onCompleteParams":[ftaw]
         });
      }
      
      private function onCom(param1:FTextArea) : void
      {
         if(param1 != null && param1.parent != null)
         {
            param1.parent.removeChild(param1);
         }
      }
      
      private function onCheckTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.jiachengSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               _loc2_ += "<textformat leading=\'6\'>";
               _loc2_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("影响着增加的属性和附加技能的效果") + "<br>" + LanResManager.getLanCommonTextWords("狼魂加成攻击：+") + this.act + "<br>";
               if(this.shengming > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("狼魂加成血量：+") + this.shengming + "<br>";
               }
               if(this.shanbi > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("狼魂加成闪避：+") + this.shanbi + "<br>";
               }
               if(this.def > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("狼魂加成防御：+") + this.def + "<br>";
               }
               if(this.baoji > 0)
               {
                  _loc2_ += LanResManager.getLanCommonTextWords("狼魂加成暴击：+") + this.baoji + "<br>";
               }
               _loc2_ += "</font></textformat>";
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.jiachengSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onCheckTip);
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
      
      private function showFireBar(param1:Boolean) : void
      {
         var b:Boolean = param1;
         if(b)
         {
            if(!this.fireBarMC)
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  if(fireBarMC)
                  {
                     return;
                  }
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  fireBarMC = _loc2_.content as MovieClip;
                  fireBarMC.x = -11 + 42 + 7;
                  fireBarMC.y = 143 - 150 + 25 + 15;
                  fireBarMC.visible = true;
                  addChildAt(fireBarMC,6);
               },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/fire.swf");
            }
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = true;
            }
            if(!this.fireBarMC1)
            {
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  if(fireBarMC1)
                  {
                     return;
                  }
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  fireBarMC1 = _loc2_.content as MovieClip;
                  fireBarMC1.x = -11 + 254 + 39 + 8;
                  fireBarMC1.y = 143 - 150 + 25 + 15;
                  fireBarMC1.visible = true;
                  addChildAt(fireBarMC1,6);
               },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/langhundun/fire.swf");
            }
            if(Boolean(this.fireBarMC1) && this.fireBarMC1.parent != null)
            {
               this.fireBarMC1.visible = true;
            }
         }
         else
         {
            if(Boolean(this.fireBarMC) && this.fireBarMC.parent != null)
            {
               this.fireBarMC.visible = false;
            }
            if(Boolean(this.fireBarMC1) && this.fireBarMC1.parent != null)
            {
               this.fireBarMC1.visible = false;
            }
         }
      }
   }
}

