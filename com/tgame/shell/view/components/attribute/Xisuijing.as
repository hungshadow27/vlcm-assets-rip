package com.tgame.shell.view.components.attribute
{
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
   import com.tgame.moudels.XiSuiJing.model.info.XiSuiJingVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   import gs.TweenMax;
   
   public class Xisuijing extends Sprite
   {
      
      public static const UI_YIJINJING_GUANBI_CLICK_X:String = "UI_YIJINJING_GUANBI_CLICK_X";
      
      public var $parent:DisplayObject;
      
      public var bgImg:Bitmap;
      
      private var previousButton:FSimpleButton;
      
      private var nextButton:FSimpleButton;
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var ftaName:FTextArea;
      
      private var lingWuBtn:SmallButton;
      
      private var fta1:FTextArea;
      
      private var fta2:FTextArea;
      
      private var fta3:FTextArea;
      
      private var fta5:FTextArea;
      
      private var fb1:FLabel;
      
      private var img:Bitmap;
      
      private var item:ItemFace;
      
      private var gongImg:DisplayObject;
      
      private var xisuijingtupoCanvas:XisuijingTupoCanvas;
      
      public var tupoBo:Boolean = false;
      
      private var jianshuContainer:Sprite;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var fc1:FCanvas;
      
      private var fc2:FCanvas;
      
      private var isDrag:Boolean;
      
      public var bg:Bitmap;
      
      private var dqId:int;
      
      private var tf:TextFormat;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var tootips1:String = "";
      
      private var fta8:FTextArea;
      
      private var fta9:FTextArea;
      
      private var tarenBo:Boolean = true;
      
      private var gongImgObj:Object;
      
      private var textSpr:Sprite;
      
      private var doubleText:FTextArea;
      
      private var fts:FTextArea;
      
      private var fts1:FTextArea;
      
      private var kuang:Bitmap;
      
      private var mainSkillItemFace1:ItemFace;
      
      private var fts2:FTextArea;
      
      private var mainSkillContainer3:Sprite;
      
      private var currSkill3:ItemFace;
      
      private var p3:Point;
      
      private var mainSkillItemFace3:ItemFace;
      
      private var mainSkill3:Skill;
      
      private var kuang3:Bitmap;
      
      private var fts3:FTextArea;
      
      private var checkZq:FCheckBox;
      
      private var fts4:FTextArea;
      
      private var checkDt:FCheckBox;
      
      private var zhenyuan:FTextArea;
      
      private var zhenyuannum:int;
      
      private var equipContainers:Sprite;
      
      private var isMain:Boolean;
      
      public function Xisuijing()
      {
         var $mask:Sprite;
         this.gongImgObj = {};
         super();
         this.bg = new Bitmap();
         this.bg.name = "ui.char.yijinjing.bg";
         addChild(this.bg);
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
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 366;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.fc1 = new FCanvas();
         this.fc1.x = 0;
         this.fc1.y = 1;
         this.fc1.width = 403;
         this.fc1.height = 212 + 11;
         this.fc1.skin = "box_transparence";
         addChild(this.fc1);
         this.textSpr = new Sprite();
         this.textSpr.x = 220;
         this.textSpr.y = 15;
         addChild(this.textSpr);
         this.doubleText = new FTextArea();
         this.doubleText.width = 170;
         this.doubleText.height = 20;
         this.doubleText.filters = StaticValue.filter;
         this.textSpr.addChild(this.doubleText);
         this.textSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onTextTip);
         this.textSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onTextTip);
         this.previousButton = new FSimpleButton();
         this.previousButton.skin = "yijinjingBtn";
         addChild(this.previousButton);
         this.previousButton.scaleX = -1;
         this.previousButton.x = 30;
         this.previousButton.y = 84;
         this.previousButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nextButton = new FSimpleButton();
         this.nextButton.skin = "yijinjingBtn";
         addChild(this.nextButton);
         this.nextButton.x = 370;
         this.nextButton.y = 84;
         this.nextButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 150;
            y = 225;
            textColor = 1309028;
            htmlText = LanResManager.getLanCommonTextWords("领悟本式获得如下提升：");
         }
         addChild(this.fta);
         this.ftaName = new FTextArea();
         with(this.ftaName)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 48;
            y = 8;
            textColor = 1309028;
         }
         addChild(this.ftaName);
         this.lingWuBtn = new SmallButton();
         this.lingWuBtn.label = LanResManager.getLanCommonTextWords("领悟本式");
         addChild(this.lingWuBtn);
         this.lingWuBtn.x = 322;
         this.lingWuBtn.y = 180 + 18;
         this.lingWuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 150;
            y = 225 + 25;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.fta1);
         this.fta5 = new FTextArea();
         with(this.fta5)
         {
            filters = StaticValue.filter;
            x = 245;
            y = 225 + 25;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.SKY_BLUE;
            htmlText = "";
         }
         addChild(this.fta5);
         this.fta2 = new FTextArea();
         with(this.fta2)
         {
            filters = StaticValue.filter;
            x = 5;
            y = 225;
            width = 152;
            height = 135;
            wordWrap = true;
         }
         addChild(this.fta2);
         this.fta8 = new FTextArea();
         with(this.fta8)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 195;
            y = 348;
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
            x = 302 + 33;
            y = 348;
            textColor = StaticValue.RED;
            htmlText = "100%";
         }
         addChild(this.fta9);
         this.jianshuContainer = new Sprite();
         addChild(this.jianshuContainer);
         with(this.jianshuContainer)
         {
            x = 10;
            y = 322;
         }
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.jianshuContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this.xisuijingtupoCanvas = new XisuijingTupoCanvas();
         addChild(this.xisuijingtupoCanvas);
         this.xisuijingtupoCanvas._parent2 = this;
         this.xisuijingtupoCanvas.x = 138;
         this.xisuijingtupoCanvas.y = -10;
         $mask = new Sprite();
         $mask.mouseEnabled = false;
         addChild($mask);
         $mask.x = 410;
         $mask.y = -10;
         with($mask.graphics)
         {
            beginFill(16711680,0.5);
            drawRect(0,0,280,390);
            endFill();
         }
         this.xisuijingtupoCanvas.mask = $mask;
         addEventListener(UI_YIJINJING_GUANBI_CLICK_X,this.aa1);
         this.fts = new FTextArea();
         this.fts.x = 220;
         this.fts.y = 35;
         this.fts.textColor = StaticValue.RED;
         this.fts.filters = StaticValue.filter;
         this.fts.width = 170;
         this.fts.height = 20;
         this.fts.htmlText = "";
         addChild(this.fts);
         ToolTips.createToolTips(this.fts,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("达摩洗髓心法") + "<br>" + LanResManager.getLanCommonTextWords("攻击2288888、防御1888888、血量488888888、暴击888、闪避888") + "<br>" + LanResManager.getLanCommonTextWords("洗髓达到顶级后，额外增加人物武学（武神临体十层、战役激昂十层）") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts1 = new FTextArea();
         this.fts1.x = 10;
         this.fts1.y = 7;
         this.fts1.textColor = StaticValue.GREEN;
         this.fts1.width = 170;
         this.fts1.height = 20;
         this.fts1.htmlText = LanResManager.getLanCommonTextWords("洗髓经最终秘籍（已激活）");
         addChild(this.fts1);
         ToolTips.createToolTips(this.fts1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("攻击688888888、防御488888888、暴击888、闪避888、血量1088888888、所有武功提升608层") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.zhenyuan = new FTextArea();
         this.zhenyuan.x = 10;
         this.zhenyuan.y = 7;
         this.zhenyuan.textColor = StaticValue.RED;
         this.zhenyuan.width = 170;
         this.zhenyuan.height = 20;
         this.zhenyuan.htmlText = LanResManager.getLanCommonTextWords("洗髓经真元（已激活）");
         addChild(this.zhenyuan);
         ToolTips.createToolTips(this.zhenyuan,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("已使用") + zhenyuannum + LanResManager.getLanCommonTextWords("个") + "<br>" + LanResManager.getLanCommonTextWords("每使用一个增加攻击+1.000.000防守+1.000.000武功层+1") + "<br>";
            return _loc1_ + "</font></textformat>";
         });
         this.kuang = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang);
         this.kuang.x = 13;
         this.kuang.y = 175;
         this.kuang3 = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.kuang3);
         this.kuang3.x = 13;
         this.kuang3.y = 130;
         this.mainSkillContainer3 = new Sprite();
         this.mainSkillContainer3.x = 15;
         this.mainSkillContainer3.y = 132;
         addChild(this.mainSkillContainer3);
         this.mainSkillContainer3.addEventListener(MouseEvent.MOUSE_DOWN,this.onSkillMouseDown);
         this.mainSkillContainer3.addEventListener(MouseEvent.MOUSE_UP,this.onSkillMouseUp);
         this.fts2 = new FTextArea();
         this.fts2.x = 10;
         this.fts2.y = 7 + 20;
         this.fts2.textColor = StaticValue.GREEN;
         this.fts2.width = 170;
         this.fts2.height = 20;
         this.fts2.htmlText = LanResManager.getLanCommonTextWords("玄铁指环(已激活)");
         addChild(this.fts2);
         ToolTips.createToolTips(this.fts2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("特殊属性：56888亿、防御52888亿、血量60888亿、所有武功提升 480000层") + "<br>" + LanResManager.getLanCommonTextWords("玄铁指环：峨嵋派自郭襄女侠创建以来至今，玄铁指环一直是峨嵋派掌门人信") + "<br>" + LanResManager.getLanCommonTextWords("物。佛光普照：双击使用可立即清除自身的随机10个负面BUFF，冷却5秒。佛") + "<br>" + LanResManager.getLanCommonTextWords("光普照，扭转乾坤。") + "</font>";
            return _loc1_ + "</textformat>";
         });
         this.fts3 = new FTextArea();
         this.fts3.x = 10 + 255 + 40 - 30;
         this.fts3.y = 7 + 20 + 105;
         this.fts3.textColor = StaticValue.GREEN;
         this.fts3.width = 110;
         this.fts3.height = 20;
         this.fts3.htmlText = LanResManager.getLanCommonTextWords("玄冰青鸾");
         this.fts3.visible = false;
         addChild(this.fts3);
         ToolTips.createToolTips(this.fts3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("玄冰青鸾：传说中早已在史前就灭绝的坐骑，千年来，多少人心生向往，无数人四处寻觅，但即使") + "<br>" + LanResManager.getLanCommonTextWords("走遍千山万水仍然了无踪迹。自大地的结界被开启后，玄冰青鸾的传说再现江湖，集天地之间神奇") + "<br>" + LanResManager.getLanCommonTextWords("精华，顶级坐骑八部真天龙以其特殊的体质与身份，汲取天地精华，经受六道轮回，历经无数劫难，") + "<br>" + LanResManager.getLanCommonTextWords("冰炎地狱：玄冰青鸾，传闻为上古神骑，因为拥有毁天灭地的技能，世人无不向往拥有此坐骑。攻") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkZq = new FCheckBox();
         addChild(this.checkZq);
         this.checkZq.x = 256 + 117;
         this.checkZq.y = 7 + 20 + 105;
         this.checkZq.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.fts4 = new FTextArea();
         this.fts4.x = 10 + 255 + 10;
         this.fts4.y = 7 + 20 + 105 + 25;
         this.fts4.textColor = StaticValue.RED;
         this.fts4.width = 110;
         this.fts4.height = 20;
         this.fts4.htmlText = LanResManager.getLanCommonTextWords("游龙（守护）");
         this.fts4.visible = false;
         addChild(this.fts4);
         ToolTips.createToolTips(this.fts4,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Du Long (Thủ Hộ): kích hoạt Du Long (Thủ Hộ) sẽ nhận được hiển thị đặc biệt tại" + "<br>" + "Công pháp Tẩy Tủy Kinh. Thuộc tính cộng thêm:" + "<br>" + "Tấn Công + 100.000.000, Phòng Thủ + 100.000.000, Bạo Kích + 100.000.000, Né" + "<br>" + "Tránh + 100.000.000" + "<br>" + "Du Long (Thủ Hộ): Khi tấn công sẽ có tỷ lệ 10% kích hoạt. Trong trạng thái này, bản " + "<br>" + "thân sẽ được Du Long Hộ Thể, miễn dịch 100% sát thương và hồi phục 10 % sinh lực" + "<br>" + "trong mỗi giây. Thời gian duy trì là 10 giây." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.checkDt = new FCheckBox();
         addChild(this.checkDt);
         this.checkDt.x = 256 + 117;
         this.checkDt.y = 7 + 20 + 105 + 25;
         this.checkDt.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.equipContainers = new Sprite();
         this.equipContainers.x = 295 - 288;
         this.equipContainers.y = 322 - 73 + 1 - 85;
         with(this.equipContainers.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,40,40);
            endFill();
         }
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         addChild(this.equipContainers);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         if(this.isMain)
         {
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.checkZq:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkZq.selectState,50]));
               break;
            case this.checkDt:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,"",[this.checkDt.selectState,97]));
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
      
      private function onTextTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.textSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onTextTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip1("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洗髓经所有属性（包括攻击、防御、血量、爆击、闪避外以及洗髓经系统内的武神林体、战役激昂）都将翻倍（2倍）。") + "</font>");
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.textSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onTextTip);
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
            if(this.isDrag)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_SKILL_DRAG_X,"",this.currSkill));
            }
            this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.jianshuContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function aa1(param1:BaseEvent) : void
      {
         this.onShowLv(false);
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.xisuijingtupoCanvas._parent2 = param1;
         this.xisuijingtupoCanvas._parent3 = this;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.previousButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_SHANGYIYE_CLICK_X));
               break;
            case this.nextButton:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_XIAYIYE_CLICK_X));
               break;
            case this.lingWuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.YIJINJING_LINGWU_SHOW_X));
               this.onShowLv(true);
         }
      }
      
      public function setInitialize(param1:Boolean, param2:XiSuiJingVO) : void
      {
         this.setMainInitialize(param2.isUseDan,param2.nowLookingID,param2.hp,param2.mp,param2.cp,param2.act,param2.def);
         this.setBowPage(param2.nowID,param2.nowLookingID);
         var _loc3_:String = param2.getSkillAddStr();
         this.setWuXueJiaCheng(_loc3_);
         this.fta2.htmlText = "<textformat leading=\'8\'><font color=\'#e66a26\'>" + param2.miaoshu + "</font></textformat>";
         this.ftaName.htmlText = "<font color=\'#d0efcb\' size=\'16\'>" + param2.nowLookingName + "</font>";
         if(param2.isDouble)
         {
            this.doubleText.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("上乘洗髓心法翻倍属性(已激活)") + "</font>";
         }
         else
         {
            this.doubleText.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("上乘洗髓心法翻倍属性(未激活)") + "</font>";
         }
         this.setJihuo(param2.isDamo);
         this.setJiHuoXisuijing(param1);
         this.isMain = param1;
         this.checkZq.selectState = param2.isZuoQi;
         this.checkDt.selectState = param2.isDanTian;
      }
      
      public function setJiHuoXisuijing(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts1.visible = GameState.dictMainStatus[SpecialGoodsID.XISUIJING_ZUIZHONGMIJI_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.XISUIJING_ZUIZHONGMIJI_JIHUO_ID])
            {
               this.fts1.htmlText = LanResManager.getLanCommonTextWords("洗髓经最终秘籍（已激活）");
               this.fts1.textColor = StaticValue.GREEN;
            }
            else
            {
               this.fts1.htmlText = LanResManager.getLanCommonTextWords("洗髓经最终秘籍（未激活）");
               this.fts1.textColor = StaticValue.RED;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.XISUIJING_FENTIANNUQI])
            {
               this.setSkillJiHuo(200257,true);
               this.mainSkillItemFace1.visible = true;
               this.kuang.visible = true;
            }
            else
            {
               this.mainSkillItemFace1 = null;
               this.kuang.visible = false;
            }
            this.fts2.visible = GameState.dictMainStatus[SpecialGoodsID.XISUIJING_XUANTIEZHIHUAN_ID];
            if(GameState.dictMainStatus[SpecialGoodsID.XISUIJING_XUANTIEZHIHUAN_ID])
            {
               this.setSkillJiHuo3(200316,true);
               this.mainSkillItemFace3.visible = true;
               this.kuang3.visible = true;
            }
            else
            {
               this.mainSkillItemFace3 = null;
               this.kuang3.visible = false;
            }
            if(GameState.dictMainStatus[SpecialGoodsID.XISUIJING_XUANBINGQINGLUAN_ID])
            {
               this.fts3.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq.visible = false;
            }
            this.fts4.visible = GameState.dictMainStatus[SpecialGoodsID.XISUIJING_YOULONG_ID];
            this.checkDt.visible = GameState.dictMainStatus[SpecialGoodsID.XISUIJING_YOULONG_ID];
            this.zhenyuan.visible = GameState.dictMainStatus[SpecialGoodsID.XISUIJING_ZHENYUAN_ID];
            this.zhenyuannum = GameState.dictMainStatus[SpecialGoodsID.XISUIJING_ZHENYUAN];
         }
         else
         {
            this.fts1.visible = GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_ZUIZHONGMIJI_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_ZUIZHONGMIJI_JIHUO_ID])
            {
               this.fts1.htmlText = LanResManager.getLanCommonTextWords("洗髓经最终秘籍（已激活）");
               this.fts1.textColor = StaticValue.GREEN;
            }
            else
            {
               this.fts1.htmlText = LanResManager.getLanCommonTextWords("洗髓经最终秘籍（未激活）");
               this.fts1.textColor = StaticValue.RED;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_FENTIANNUQI])
            {
               this.setSkillJiHuo(200257,true);
               this.mainSkillItemFace1.visible = true;
               this.kuang.visible = true;
            }
            else
            {
               this.mainSkillItemFace1 = null;
               this.kuang.visible = false;
            }
            this.fts2.visible = GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_XUANTIEZHIHUAN_ID];
            if(GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_XUANTIEZHIHUAN_ID])
            {
               this.setSkillJiHuo3(200316,true);
               this.mainSkillItemFace3.visible = true;
               this.kuang3.visible = true;
            }
            else
            {
               this.mainSkillItemFace3 = null;
               this.kuang3.visible = false;
            }
            if(GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_XUANBINGQINGLUAN_ID])
            {
               this.fts3.visible = true;
               this.checkZq.visible = true;
            }
            else
            {
               this.fts3.visible = false;
               this.checkZq.visible = false;
            }
            this.fts4.visible = GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_YOULONG_ID];
            this.checkDt.visible = GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_YOULONG_ID];
            this.zhenyuan.visible = GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_ZHENYUAN_ID];
            this.zhenyuannum = GameState.dictTargetStatus[SpecialGoodsID.XISUIJING_ZHENYUAN];
         }
      }
      
      private function setWuXueJiaCheng(param1:String) : void
      {
         var _loc2_:Array = param1.split(";");
         var _loc3_:String = "<textformat leading=\'6\'>";
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ += _loc2_[_loc4_] + "<br>";
            _loc4_++;
         }
         _loc3_ += "</textformat>";
         this.fta5.htmlText = _loc3_;
      }
      
      private function setMainInitialize(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:String = "";
         _loc8_ = _loc8_ + ("<textformat leading=\'6\'><font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>");
         if(param1 && param2 == 10)
         {
            _loc8_ += LanResManager.getLanCommonTextWords("攻击：+") + param6 + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param7 + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param3 + " " + "X" + " 2" + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("体力：+") + param5 + "<br>";
         }
         else
         {
            _loc8_ += LanResManager.getLanCommonTextWords("攻击：+") + param6 + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + param7 + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + param3 + "<br>" + LanResManager.getLanCommonTextWords("内力：+") + param4 + "<br>" + LanResManager.getLanCommonTextWords("体力：+") + param5 + "<br>";
         }
         _loc8_ += "</font>";
         _loc8_ = _loc8_ + "</textformat>";
         this.fta1.htmlText = _loc8_;
      }
      
      private function setSkill(param1:Skill, param2:Boolean) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.setShowCount(false);
         this.jianshuContainer.addChild(this.item);
         if(param2)
         {
            this.item.filters = [];
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
      }
      
      private function setBowPage(param1:int, param2:int) : void
      {
         this.dqId = param2;
         if(this.gongImg != null && this.gongImg.parent != null)
         {
            removeChild(this.gongImg);
         }
         if(this.tarenBo)
         {
            if(param2 == 0)
            {
               if(this.gongImgObj[1] != null)
               {
                  this.gongImg = this.gongImgObj[1];
               }
               else
               {
                  this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xisuijing/" + 1 + ".jpg",400,223);
                  this.gongImgObj[1] = this.gongImg;
               }
            }
            else if(this.gongImgObj[param2] != null)
            {
               this.gongImg = this.gongImgObj[param2];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xisuijing/" + param2 + ".jpg",400,223);
               this.gongImgObj[param2] = this.gongImg;
            }
         }
         else if(param1 == 0)
         {
            if(this.gongImgObj[1] != null)
            {
               this.gongImg = this.gongImgObj[1];
            }
            else
            {
               this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xisuijing/" + 1 + ".jpg",400,223);
               this.gongImgObj[1] = this.gongImg;
            }
         }
         else if(this.gongImgObj[param1] != null)
         {
            this.gongImg = this.gongImgObj[param1];
         }
         else
         {
            this.gongImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/xisuijing/" + param1 + ".jpg",400,223);
            this.gongImgObj[param1] = this.gongImg;
         }
         if(param2 == 1)
         {
            this.previousButton.enabled = false;
         }
         else
         {
            this.previousButton.enabled = true;
         }
         if(param2 == 10)
         {
            this.nextButton.enabled = false;
         }
         else
         {
            this.nextButton.enabled = true;
         }
         param2--;
         if(param1 > param2 && param2 >= 0)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("已领悟");
            this.lingWuBtn.enabled = false;
         }
         else if(param1 == param2)
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("开始领悟");
            this.lingWuBtn.enabled = true;
         }
         else
         {
            this.lingWuBtn.label = LanResManager.getLanCommonTextWords("未领悟");
            this.lingWuBtn.enabled = false;
         }
         this.gongImg.x = 198 - this.gongImg.width / 2 + 5;
         this.gongImg.y = 106 - this.gongImg.height / 2 + 5;
         addChildAt(this.gongImg,1);
      }
      
      public function onShowLv(param1:Boolean) : void
      {
         if(param1)
         {
            if(this.xisuijingtupoCanvas.x == 138)
            {
               TweenMax.to(this.xisuijingtupoCanvas,1,{"x":410});
               this.tupoBo = true;
            }
            this.lingWuBtn.enabled = false;
            this.previousButton.enabled = false;
            this.nextButton.enabled = false;
         }
         else
         {
            if(this.xisuijingtupoCanvas.x == 410)
            {
               TweenMax.to(this.xisuijingtupoCanvas,1,{"x":138});
               this.tupoBo = false;
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ_X,"",false));
            }
            this.lingWuBtn.enabled = true;
            if(this.dqId == 1)
            {
               this.previousButton.enabled = false;
            }
            else
            {
               this.previousButton.enabled = true;
            }
            if(this.dqId == 10)
            {
               this.nextButton.enabled = false;
            }
            else
            {
               this.nextButton.enabled = true;
            }
         }
      }
      
      public function isYijinjingtupoCanvasShow() : Boolean
      {
         if(this.xisuijingtupoCanvas.x == 410)
         {
            return true;
         }
         return false;
      }
      
      public function setYijinjingLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:String) : void
      {
         this.xisuijingtupoCanvas.setInitialize(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function setYijinjingLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xisuijingtupoCanvas.setZhufuzhi(param1,param2,param3);
      }
      
      public function setYijinjingLingwuJiyuanzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.xisuijingtupoCanvas.setJiyuanzhi(param1,param2,param3);
      }
      
      public function setYijinjingLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this.xisuijingtupoCanvas.setGoods(param1,param2);
      }
      
      public function setYijinjingLingwuBtn(param1:Boolean) : void
      {
         this.xisuijingtupoCanvas.setBtn(param1);
      }
      
      public function setYiJinJingEnabledFun() : void
      {
         this.lingWuBtn.enabled = this.lingWuBtn.visible = false;
         this.previousButton.enabled = this.previousButton.visible = false;
         this.nextButton.enabled = this.nextButton.visible = false;
         this.tarenBo = false;
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
      
      private function setJihuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.fts.textColor = StaticValue.GREEN;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("达摩洗髓心法属性(已激活)");
         }
         else
         {
            this.fts.textColor = StaticValue.RED;
            this.fts.htmlText = LanResManager.getLanCommonTextWords("达摩洗髓心法属性(未激活)");
         }
      }
      
      public function setSkillJiHuo(param1:int, param2:Boolean) : void
      {
         if(this.mainSkillItemFace1)
         {
            if(this.mainSkillItemFace1.parent)
            {
               this.mainSkillItemFace1.parent.removeChild(this.mainSkillItemFace1);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         _loc3_.isLearn = 1;
         this.mainSkillItemFace1 = new ItemFace(_loc3_);
         this.mainSkillItemFace1.showKungFuTag();
         this.mainSkillItemFace1.setShowCount(false);
         this.mainSkillItemFace1.x = 13 + 2;
         this.mainSkillItemFace1.y = 175 + 2;
         addChild(this.mainSkillItemFace1);
      }
      
      private function onSkillMouseDown(param1:MouseEvent) : void
      {
         this.mainSkillContainer3.addEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onSkillMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.mainSkillContainer3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,"",this.currSkill));
            }
            this.mainSkillContainer3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
         }
      }
      
      private function onSkillMouseUp(param1:MouseEvent) : void
      {
         this.mainSkillContainer3.removeEventListener(MouseEvent.MOUSE_MOVE,this.onSkillMouseMove);
      }
      
      public function setSkillJiHuo3(param1:int, param2:Boolean) : void
      {
         while(this.mainSkillContainer3.numChildren > 0)
         {
            this.mainSkillContainer3.removeChildAt(0);
         }
         if(this.mainSkillItemFace3)
         {
            if(this.mainSkillItemFace3.parent)
            {
               this.mainSkillItemFace3.parent.removeChild(this.mainSkillItemFace3);
            }
         }
         var _loc3_:Skill = new Skill(param1);
         if(param2)
         {
            _loc3_.isLearn = 1;
         }
         else
         {
            _loc3_.isLearn = 0;
         }
         this.mainSkillItemFace3 = new ItemFace(_loc3_);
         this.mainSkillItemFace3.showKungFuTag();
         this.mainSkillItemFace3.setShowCount(false);
         this.mainSkillContainer3.addChild(this.mainSkillItemFace3);
      }
      
      public function set_XiSuiJing(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            if(_loc3_.res.position == ItemPositionRange.POSTION_20171115XISUIHUAYUANJUE)
            {
               _loc4_.x = 4 + 1;
               _loc4_.y = 4 + 1;
               _loc4_.Select = true;
               _loc4_.isHotGoods = true;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
   }
}

