package com.tgame.moudels.zhongzhixuanyuanjian.controller
{
   import com.tgame.moudels.zhongzhixuanyuanjian.model.ZhongZhiXuanYuanJian_MsgSendProxy;
   import com.tgame.moudels.zhongzhixuanyuanjian.view.ZhongZhiXuanYuanJian_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ZhongZhiXuanYuanJian_StartupCommand extends SimpleCommand
   {
      
      public function ZhongZhiXuanYuanJian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZhongZhiXuanYuanJian_MsgSendProxy());
         facade.registerMediator(new ZhongZhiXuanYuanJian_Mediator());
      }
   }
}

