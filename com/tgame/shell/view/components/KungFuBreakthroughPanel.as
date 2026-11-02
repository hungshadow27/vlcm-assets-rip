package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.kungfu.KungFuBreakthroughSeeAboutCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class KungFuBreakthroughPanel extends FPanel
   {
      
      public static const XINFACHAXUN_CLICK:String = "XINFACHAXUN_CLICK";
      
      public var $parent:DisplayObject;
      
      private var tip:FTextArea;
      
      private var tip1:FTextArea;
      
      private var tip2:FTextArea;
      
      private var kstpBtn:SecondButton;
      
      private var pjcxBtn:SecondButton;
      
      private var kungfuBreakthroughSeeAbout:KungFuBreakthroughSeeAboutCanvas;
      
      private var skillId:int;
      
      public function KungFuBreakthroughPanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 297;
         height = 256;
         titleText = LanResManager.getLanCommonTextWords("突破瓶颈");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.kungfu.breakthrough.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         tf.align = "center";
         this.tip1 = new FTextArea();
         with(this.tip1)
         {
            x = 15;
            y = 7;
            width = 250;
            wordWrap = true;
            textColor = StaticValue.BLUE;
            htmlText = "";
         }
         addChild(this.tip1);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 15;
            y = 35;
            width = 250;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanCommonTextWords("突破瓶颈") + "：";
         }
         addChild(this.tip);
         this.tip2 = new FTextArea();
         with(this.tip2)
         {
            x = 68;
            y = 53;
            width = 250;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanCommonTextWords("突破瓶颈") + "<br>" + LanResManager.getLanCommonTextWords("突破瓶颈") + "<br>" + LanResManager.getLanCommonTextWords("突破瓶颈") + "<br>" + LanResManager.getLanCommonTextWords("突破瓶颈") + "<br>";
         }
         addChild(this.tip2);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 15;
            y = 127;
            width = 280;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("只有成功突破瓶颈后，该心法才能继续提升等级") + "<font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("成功突破该心法后的7天时间属于巩固领悟阶段") + "<font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("本段时间内若其他心法遇到瓶颈，您将无法突破") + "<font><br>" + "</textformat>";
         }
         addChild(this.tip);
         this.kstpBtn = new SecondButton();
         this.kstpBtn.label = LanResManager.getLanCommonTextWords("开始突破");
         addChild(this.kstpBtn);
         this.kstpBtn.x = 49;
         this.kstpBtn.y = 193;
         this.kstpBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.pjcxBtn = new SecondButton();
         this.pjcxBtn.label = LanResManager.getLanCommonTextWords("心法瓶颈查询");
         addChild(this.pjcxBtn);
         this.pjcxBtn.x = 155;
         this.pjcxBtn.y = 193;
         this.pjcxBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         addEventListener(XINFACHAXUN_CLICK,this.kungfuBreakthroughSeeAboutClose);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function onClose1() : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.kstpBtn:
               this.$parent.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFUBREAKTHROUGHPANEL_KSTPCLICK,"",this.skillId));
               break;
            case this.pjcxBtn:
               if(!this.kungfuBreakthroughSeeAbout)
               {
                  this.kungfuBreakthroughSeeAbout = new KungFuBreakthroughSeeAboutCanvas();
               }
               this.kungfuBreakthroughSeeAbout.visible = true;
               this.kungfuBreakthroughSeeAbout.$parent = this;
               addChild(this.kungfuBreakthroughSeeAbout);
               this.kungfuBreakthroughSeeAbout.x = 297;
               this.kungfuBreakthroughSeeAbout.y = -33;
         }
      }
      
      public function kungfuBreakthroughSeeAboutClose(param1:BaseEvent) : void
      {
         if(Boolean(this.kungfuBreakthroughSeeAbout) && Boolean(this.kungfuBreakthroughSeeAbout.parent))
         {
            this.kungfuBreakthroughSeeAbout.parent.removeChild(this.kungfuBreakthroughSeeAbout);
            this.kungfuBreakthroughSeeAbout = null;
         }
      }
      
      public function setInitialize(param1:Skill) : void
      {
         var _loc2_:SkillRes = SkillResManager.getSkillRes(param1.id);
         this.skillId = param1.id;
         var _loc3_:Array = new Array();
         _loc3_ = param1.tupoInfo.getTupoGoods();
         var _loc4_:String = "";
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc4_ += LanResManager.getLanCommonTextWords("需要") + " " + _loc3_[_loc5_] + "<br>";
            _loc5_++;
         }
         this.tip1.htmlText = LanResManager.getLanCommonTextWords("心法") + "【" + _loc2_.name + "】    " + LanResManager.getLanCommonTextWords("已经进入了瓶颈阶段");
         this.tip2.htmlText = _loc4_ + LanResManager.getLanCommonTextWords("需要真气") + "：" + param1.tupoInfo.tupoZhenqi + "<br>" + LanResManager.getLanCommonTextWords("需要铜钱") + "：" + param1.tupoInfo.tupoCopper + "<br>" + LanResManager.getLanCommonTextWords("本次突破成功几率") + "：" + param1.tupoInfo.tupoGailv / 100 + "%<br>";
      }
   }
}

