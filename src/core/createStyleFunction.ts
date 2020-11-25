import { betterGet } from './get';
import { Props, PropertyConfig, SystemConfig, Cache } from '@/types';
import * as CSS from 'csstype';

const getValue = (
  value: any,
  scale: any,
  _props: Props,
  strict: boolean,
  undef?: undefined
) => {
  return betterGet(scale, value, strict === true ? undef : value);
};

export const createStyleFunction = ({
  properties,
  property,
  scale,
  transform = getValue,
  defaultScale,
}: PropertyConfig): SystemConfig => {
  const _properties = properties || [property];

  const systemConfig = (
    value: unknown,
    scale: any,
    props: Props,
    cache: Cache
  ) => {
    const result: Record<string, any> = {};
    const n = transform(value, scale, props, cache.strict);
    if (n === null) {
      return result;
    }
    _properties.forEach((prop: keyof CSS.Properties | undefined) => {
      if (prop) {
        result[prop] = n;
      }
    });
    return result;
  };

  Object.assign(systemConfig, { scale, defaultScale });
  return systemConfig;
};
