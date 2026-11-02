package com.tgame.shell.view.components.yuanwu
{
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.display.Image;
   import game.display.Label;
   import game.display.SimpleButton;
   import game.display.Stepper;
   import game.skin.YuanWuSkin;
   import game.utils.SkinTools;
   
   public class XuanyuanhuanyuejianPanel extends BasePanel
   {
      
      private var guanbi:SimpleButton;
      
      private var item:ItemFace;
      
      private var _container:Container;
      
      private var _stepper:Stepper;
      
      public var $parent:DisplayObject;
      
      private var type:int;
      
      private var label1:Label;
      
      private var label2:Label;
      
      private var label3:Label;
      
      private var label4:Label;
      
      private var label5:Label;
      
      private var label6:Label;
      
      private var label7:Label;
      
      private var label8:Label;
      
      private var label9:Label;
      
      private var label10:Label;
      
      private var label11:Label;
      
      private var label12:Label;
      
      private var label13:Label;
      
      private var label14:Label;
      
      private var label15:Label;
      
      private var label16:Label;
      
      private var label17:Label;
      
      private var label18:Label;
      
      private var label19:Label;
      
      private var label20:Label;
      
      private var label21:Label;
      
      private var label22:Label;
      
      private var label23:Label;
      
      private var label24:Label;
      
      private var arr:Array;
      
      private var bg1:Image;
      
      private var bg2:Image;
      
      private var img1:Image;
      
      private var img2:Image;
      
      private var img3:Image;
      
      private var img4:Image;
      
      private var img5:Image;
      
      private var img6:Image;
      
      private var img7:Image;
      
      private var img8:Image;
      
      private var img9:Image;
      
      private var img10:Image;
      
      private var img11:Image;
      
      private var img12:Image;
      
      private var img13:Image;
      
      private var img14:Image;
      
      private var img15:Image;
      
      private var img16:Image;
      
      private var img17:Image;
      
      private var img18:Image;
      
      private var img19:Image;
      
      private var img20:Image;
      
      private var img21:Image;
      
      private var img22:Image;
      
      private var img23:Image;
      
      public function XuanyuanhuanyuejianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YuanWuSkin.skin,"zhanshitu1");
      }
      
      override protected function createVariableReference() : void
      {
         this.bg1 = getChildByName("tupiandi1") as Image;
         this.bg2 = getChildByName("tupiandi2") as Image;
         this.bg2.visible = false;
         this.img1 = getChildByName("zhuangbeiming1") as Image;
         this.img2 = getChildByName("zhuangbeiming2") as Image;
         this.img3 = getChildByName("zhuangbeiming3") as Image;
         this.img4 = getChildByName("zhuangbeiming4") as Image;
         this.img5 = getChildByName("zhuangbeiming5") as Image;
         this.img6 = getChildByName("zhuangbeiming6") as Image;
         this.img7 = getChildByName("zhuangbeiming7") as Image;
         this.img8 = getChildByName("zhuangbeiming8") as Image;
         this.img9 = getChildByName("zhuangbeiming9") as Image;
         this.img10 = getChildByName("zhuangbeiming10") as Image;
         this.img11 = getChildByName("zhuangbeiming11") as Image;
         this.img12 = getChildByName("zhuangbeiming12") as Image;
         this.img13 = getChildByName("zhuangbeiming13") as Image;
         this.img14 = getChildByName("zhuangbeiming14") as Image;
         this.img15 = getChildByName("zhuangbeiming15") as Image;
         this.img16 = getChildByName("zhuangbeiming16") as Image;
         this.img17 = getChildByName("zhuangbeiming17") as Image;
         this.img18 = getChildByName("zhuangbeiming18") as Image;
         this.img19 = getChildByName("zhuangbeiming19") as Image;
         this.img20 = getChildByName("zhuangbeiming20") as Image;
         this.img21 = getChildByName("zhuangbeiming21") as Image;
         this.img22 = getChildByName("zhuangbeiming22") as Image;
         this.img23 = getChildByName("zhuangbeiming23") as Image;
         this.label1 = getChildByName("zisepinzhi2") as Label;
         this.label2 = getChildByName("jinsepinzhi2") as Label;
         this.label3 = getChildByName("hongsepinzhi2") as Label;
         this.label4 = getChildByName("zisepinzhi4") as Label;
         this.label5 = getChildByName("jinsepinzhi4") as Label;
         this.label6 = getChildByName("hongsepinzhi4") as Label;
         this.label7 = getChildByName("baisepinzhi1") as Label;
         this.label8 = getChildByName("baisepinzhi2") as Label;
         this.label9 = getChildByName("baisepinzhi3") as Label;
         this.label10 = getChildByName("baisepinzhi4") as Label;
         this.label11 = getChildByName("lvsepinzhi1") as Label;
         this.label12 = getChildByName("lvsepinzhi2") as Label;
         this.label13 = getChildByName("lvsepinzhi3") as Label;
         this.label14 = getChildByName("lvsepinzhi4") as Label;
         this.label15 = getChildByName("lansepinzhi1") as Label;
         this.label16 = getChildByName("lansepinzhi2") as Label;
         this.label17 = getChildByName("lansepinzhi3") as Label;
         this.label18 = getChildByName("lansepinzhi4") as Label;
         var _loc1_:int = 7;
         while(_loc1_ < 19)
         {
            this["label" + _loc1_].text = "";
            _loc1_++;
         }
         this.guanbi = getChildByName("guanbi") as SimpleButton;
         this._stepper = getChildByName("fanye") as Stepper;
         this._stepper.maximum = 2;
         this._stepper.value = 1;
         this._stepper.addEventListener(Event.CHANGE,this.onChange);
         this.guanbi.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      public function setData(param1:int, param2:int, param3:Array) : void
      {
         this.type = param1;
         this._stepper.value = param2;
         this.arr = param3;
         var _loc4_:int = 0;
         _loc4_ = 0;
         while(_loc4_ < 3)
         {
            this["label" + String(_loc4_ + 1)].text = param3[_loc4_];
            _loc4_++;
         }
         _loc4_ = 1;
         while(_loc4_ <= 23)
         {
            if(_loc4_ == param1)
            {
               this["img" + _loc4_].visible = true;
            }
            else
            {
               this["img" + _loc4_].visible = false;
            }
            _loc4_++;
         }
         this.onChange(null);
      }
      
      private function onChange(param1:Event) : void
      {
         var _loc2_:int = this._stepper.value;
         var _loc3_:Object = {};
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         switch(this._stepper.value)
         {
            case 1:
               if(this.type == 1 || this.type == 2 || this.type == 3 || this.type == 4 || this.type == 5 || this.type == 6 || this.type == 7 || this.type == 8 || this.type == 9 || this.type == 10 || this.type == 11 || this.type == 12 || this.type == 13 || this.type == 14 || this.type == 15 || this.type == 16 || this.type == 17 || this.type == 18 || this.type == 19 || this.type == 20 || this.type == 21 || this.type == 22 || this.type == 23)
               {
                  _loc4_ = 5;
                  _loc5_ = 10;
                  _loc6_ = 15;
               }
               this.label4.text = "隐龙诀功 +" + _loc4_ + " 层  最大可提升至 +" + _loc4_ + " 层";
               this.label5.text = "隐龙诀功 +" + _loc5_ + " 层  最大可提升至 +" + _loc5_ + " 层" + "\n" + "隐龙诀功 +" + _loc5_ + " 层  最大可提升至 +" + _loc5_ + " 层";
               this.label6.text = "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层" + "\n" + "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层" + "\n" + "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层";
               this.bg1.visible = true;
               this.bg2.visible = false;
               break;
            case 2:
               if(this.type == 1 || this.type == 2 || this.type == 3 || this.type == 4 || this.type == 5 || this.type == 6 || this.type == 7 || this.type == 8 || this.type == 9 || this.type == 10 || this.type == 11 || this.type == 12 || this.type == 13 || this.type == 14 || this.type == 15 || this.type == 16 || this.type == 17 || this.type == 18 || this.type == 19 || this.type == 20 || this.type == 21 || this.type == 22 || this.type == 23)
               {
                  _loc4_ = 20;
                  _loc5_ = 30;
                  _loc6_ = 40;
               }
               this.label4.text = "隐龙诀功 +" + _loc4_ + " 层  最大可提升至 +" + _loc4_ + " 层" + "\n" + "隐龙诀功 +" + _loc4_ + " 层  最大可提升至 +" + _loc4_ + " 层" + "\n" + "隐龙诀功 +" + _loc4_ + " 层  最大可提升至 +" + _loc4_ + " 层" + "\n" + "隐龙诀功 +" + _loc4_ + " 层  最大可提升至 +" + _loc4_ + " 层";
               this.label5.text = "隐龙诀功 +" + _loc5_ + " 层  最大可提升至 +" + _loc5_ + " 层" + "\n" + "隐龙诀功 +" + _loc5_ + " 层  最大可提升至 +" + _loc5_ + " 层" + "\n" + "隐龙诀功 +" + _loc5_ + " 层  最大可提升至 +" + _loc5_ + " 层" + "\n" + "隐龙诀功 +" + _loc5_ + " 层  最大可提升至 +" + _loc5_ + " 层" + "\n" + "隐龙诀功 +" + _loc5_ + " 层  最大可提升至 +" + _loc5_ + " 层";
               this.label6.text = "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层" + "\n" + "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层" + "\n" + "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层" + "\n" + "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层" + "\n" + "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层" + "\n" + "隐龙诀功 +" + _loc6_ + " 层  最大可提升至 +" + _loc6_ + " 层";
               this.bg1.visible = false;
               this.bg2.visible = true;
         }
         this.$parent.dispatchEvent(new BaseEvent(YuanwuPanel.YUANWU_ZHANSHI,"",[this.type,_loc2_]));
      }
   }
}

