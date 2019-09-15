import { Uri } from 'coc.nvim';
import { PrettierVSCodeConfig, Prettier, PrettierSupportInfo, ParserOption } from './types.d';
export declare function getConfig(uri?: Uri): PrettierVSCodeConfig;
export declare function getParsersFromLanguageId(languageId: string, prettierInstance: Prettier, path?: string): ParserOption[];
export declare function allLanguages(): string[];
export declare function enabledLanguages(): string[];
export declare function rangeLanguages(): string[];
export declare function getGroup(group: string): PrettierSupportInfo['languages'];
