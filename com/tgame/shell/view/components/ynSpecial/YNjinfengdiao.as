package com.tgame.shell.view.components.ynSpecial
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameState;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
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
   import flash.geom.Point;
   
   public class YNjinfengdiao extends Sprite
   {
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var equipContainer:Sprite;
      
      private var isMain:Boolean = false;
      
      public var $parent:DisplayObject;
      
      private var p:Point;
      
      private var currSkill:ItemFace;
      
      private var isDrag:Boolean = false;
      
      private var skillContainer:Sprite;
      
      private var arrGO:Array = [];
      
      private var gongImgObj:Object = {};
      
      private var spr:Sprite;
      
      private var ft3:FTextArea;
      
      private var bc:Sprite;
      
      public function YNjinfengdiao()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         var bg1:DisplayObject;
         var bg2:DisplayObject = null;
         var bg:DisplayObject = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/jinfengdiao/bg1.swf");
         bg.x = 2;
         bg.y = 2;
         addChild(bg);
         this.bc = new Sprite();
         addChild(this.bc);
         bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/jinfengdiao/jinfengdiao.swf");
         bg1.x = 2;
         bg1.y = 2;
         this.bc.addChild(bg1);
         bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/jinfengdiao/bg2.swf");
         bg2.x = 2;
         bg2.y = 201;
         addChild(bg2);
         this.spr = new Sprite();
         addChild(this.spr);
         this.ft1 = new FTextArea();
         this.ft1.x = 130;
         this.ft1.y = 210;
         this.ft1.textColor = StaticValue.YELLOW;
         this.ft1.htmlText = "";
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         this.ft2.x = 130;
         this.ft2.y = 230;
         this.ft2.textColor = StaticValue.YELLOW;
         this.ft2.htmlText = "";
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         this.ft3.x = 10;
         this.ft3.y = 10;
         this.ft3.textColor = StaticValue.GREEN;
         this.ft3.width = 110;
         this.ft3.height = 20;
         this.ft3.htmlText = "Phi Thăng Điêu";
         this.ft3.visible = false;
         addChild(this.ft3);
         ToolTips.createToolTips(this.ft3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "Khi kích hoạt Phi Thăng Điêu. Nhân vật kháng 100% hiệu quả của kỹ năng Ngũ Long Bối Thiên." + "<br>" + "Đồng thời, khi tấn công đối thủ 100% kích hoạt kỹ năng khiến đối phương bị giảm 10.000 Tốc" + "<br>" + "Độ Đánh của đối thủ trong 5 giây. Không có thời gian chờ. Kỹ năng không tính cộng dồn." + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.equipContainer = new Sprite();
         this.equipContainer.x = 35;
         this.equipContainer.y = 250;
         with(this.equipContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,340,50);
            endFill();
         }
         this.equipContainer.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick,false,30);
         this.skillContainer = new Sprite();
         this.skillContainer.x = 35;
         this.skillContainer.y = 310;
         addChild(this.skillContainer);
         with(this.skillContainer.graphics)
         {
            beginFill(16711680,0);
            drawRect(0,0,340,50);
            endFill();
         }
         this.skillContainer.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.skillContainer.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         addChild(this.equipContainer);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.p = new Point(mouseX,mouseY);
         this.currSkill = param1.target as ItemFace;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(this.currSkill != param1.target)
         {
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            return;
         }
         if(Math.abs(this.p.x - mouseX) > 5 || Math.abs(this.p.y - mouseY) > 5 || Math.sqrt(this.p.x * this.p.x + this.p.y * this.p.y) > 5)
         {
            if((this.currSkill.getBaseItem() as Skill).res.useway == 1 && (this.currSkill.getBaseItem() as Skill).isLearn == 1)
            {
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_YNJINFENGDIAO_SKILL_DRAG,"",this.currSkill));
            }
            this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         }
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.skillContainer.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Goods = null;
         if(this.isMain)
         {
            _loc2_ = param1.target as ItemFace;
            if(_loc2_ == null)
            {
               return;
            }
            _loc3_ = _loc2_.getBaseItem() as Goods;
            if(_loc3_ == null)
            {
               return;
            }
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_CHAR_ATTRIBUTE_MENU_SHOW,"",param1));
         }
      }
      
      public function setData(param1:Array, param2:String, param3:String, param4:Boolean) : void
      {
         this.isMain = param4;
         this.set_Equip(param1);
         this.ft1.htmlText = param2;
         this.ft2.htmlText = param3;
         if(this.isMain)
         {
            this.ft3.visible = GameState.dictMainStatus[729450];
         }
         else
         {
            this.ft3.visible = GameState.dictTargetStatus[729450];
         }
      }
      
      public function set_Equip(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Goods = null;
         var _loc5_:ItemFace = null;
         var _loc6_:DisplayObject = null;
         var _loc7_:Bitmap = null;
         var _loc8_:DisplayObject = null;
         var _loc9_:Skill = null;
         var _loc10_:ItemFace = null;
         var _loc11_:int = 0;
         while(this.equipContainer.numChildren > 0)
         {
            this.equipContainer.removeChildAt(0);
         }
         while(this.spr.numChildren > 0)
         {
            this.spr.removeChildAt(0);
         }
         this.arrGO = [];
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc4_ = param1[_loc2_] as Goods;
            _loc5_ = new ItemFace(_loc4_);
            switch(ItemPositionRange.POSITION_JINFENGDIAO.indexOf(_loc4_.res.position))
            {
               case 0:
                  _loc5_.x = 2 + 60 * 0;
                  _loc5_.y = 2;
                  this.equipContainer.addChild(_loc5_);
                  if(_loc4_.id == 724542)
                  {
                     this.arrGO.push(80200294);
                  }
                  break;
               case 1:
                  _loc5_.x = 2 + 60 * 1;
                  _loc5_.y = 2;
                  this.equipContainer.addChild(_loc5_);
                  if(_loc4_.id == 724553)
                  {
                     this.arrGO.push(80200295);
                  }
                  break;
               case 2:
                  _loc5_.x = 2 + 60 * 2;
                  _loc5_.y = 2;
                  this.equipContainer.addChild(_loc5_);
                  if(_loc4_.id == 724564)
                  {
                     this.arrGO.push(80200296);
                  }
                  break;
               case 3:
                  _loc5_.x = 2 + 60 * 3;
                  _loc5_.y = 2;
                  this.equipContainer.addChild(_loc5_);
                  if(_loc4_.id == 724575)
                  {
                     this.arrGO.push(80200297);
                  }
                  break;
               case 4:
                  _loc5_.x = 2 + 60 * 4;
                  _loc5_.y = 2;
                  this.equipContainer.addChild(_loc5_);
                  if(_loc4_.id == 724586)
                  {
                     this.arrGO.push(80200298);
                  }
                  break;
               case 5:
                  _loc5_.x = 2 + 60 * 5;
                  _loc5_.y = 2;
                  this.equipContainer.addChild(_loc5_);
                  if(_loc4_.id == 724597)
                  {
                     while(this.bc.numChildren > 0)
                     {
                        this.bc.removeChildAt(0);
                     }
                     _loc6_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/jinfengdiao/jinfengdiao1.swf");
                     _loc6_.x = 2;
                     _loc6_.y = 2;
                     this.bc.addChild(_loc6_);
                     this.bc.addChild(_loc6_);
                     this.arrGO.push(80200299);
                  }
            }
            _loc2_++;
         }
         var _loc3_:Array = [80200294,80200295,80200296,80200297,80200298,80200299];
         _loc2_ = 0;
         while(_loc2_ < 6)
         {
            _loc7_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc7_.x = 35 + 60 * _loc2_;
            _loc7_.y = 250;
            addChildAt(_loc7_,3);
            _loc8_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/jinfengdiao/jt.swf");
            _loc8_.x = 35 + 12 + 60 * _loc2_;
            _loc8_.y = 250 + 42;
            addChild(_loc8_);
            _loc7_ = StaticValue.getBitmapByClassName("ui.tiem.slot");
            _loc7_.x = 60 * _loc2_;
            _loc7_.y = 0;
            this.skillContainer.addChild(_loc7_);
            _loc9_ = new Skill(_loc3_[_loc2_]);
            _loc10_ = new ItemFace(_loc9_);
            _loc10_.x = 2 + 60 * _loc2_;
            _loc10_.y = 2;
            _loc10_.setShowCount(false);
            if(this.arrGO.length != 0)
            {
               _loc11_ = 0;
               while(_loc11_ < this.arrGO.length)
               {
                  if(this.arrGO.indexOf(_loc3_[_loc2_]) != -1)
                  {
                     _loc9_.isLearn = 1;
                     _loc10_.filters = [];
                     this.setMC(_loc11_ + 1);
                  }
                  else
                  {
                     _loc9_.isLearn = 0;
                     _loc10_.filters = Tools.blackWhiteFilter;
                  }
                  _loc11_++;
               }
            }
            else
            {
               _loc9_.isLearn = 0;
               _loc10_.filters = Tools.blackWhiteFilter;
            }
            this.skillContainer.addChild(_loc10_);
            _loc2_++;
         }
      }
      
      private function setMC(param1:int) : void
      {
         var selectMc:MovieClip = null;
         var urlselect:String = null;
         var index:int = param1;
         selectMc = new MovieClip();
         urlselect = GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/jinfengdiao/" + index + ".swf";
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != urlselect)
            {
               return;
            }
            if(Boolean(selectMc) && selectMc.parent != null)
            {
               selectMc.stop();
               selectMc.parent.removeChild(selectMc);
            }
            selectMc = _loc2_.content as MovieClip;
            if(selectMc)
            {
               selectMc.x = 2;
               spr.addChild(selectMc);
            }
         },null,false,urlselect);
      }
   }
}

