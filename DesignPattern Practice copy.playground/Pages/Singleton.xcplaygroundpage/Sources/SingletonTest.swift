import Foundation

public class SingletonTester
{
    public static func isSingleton<T: AnyObject>(objects:(T,T)) -> Bool
  {
        if objects.0 === objects.1 {
            return true
        }
        return false
    }
}
